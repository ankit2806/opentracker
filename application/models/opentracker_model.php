<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class OpenTracker_model extends CI_Model {
	public function __construct(){
	}

	public function checkInsertTokenInDB( $token ){

        /* Check for the toek existence in database */
        $this->db->select('token');

        $this->db->where('token', $token);
        $sql = $this->db->get('ot_tokens');
        if( $sql->num_rows() ){
            return TRUE;
        } else {
            /* Insert new token in database */
            $data = array(
                'token' => $token
            );

            $this->db->insert('ot_tokens', $data);
        }

        return FALSE;
    }

    public function insertTrackToken( $token, $userData ){
        
        $this->db->query('LOCK TABLES ot_tokentracks WRITE, ot_tokens WRITE');

        /* Check if token exists in our system */
        $this->db->where('token', $token);
        $sql = $this->db->get('ot_tokens');
        if( $sql->num_rows() ){
            $result = $sql->row();

            /* Insert user log against the token */
            $userData['tokenId'] = $result->id;

            /* Check entry for the same user for given token */
            $this->db->where('tokenId', $result->id);
            $this->db->where('userIP', $userData['userIP']);

            $count = $this->db->count_all_results('ot_tokentracks');
            if( !$count ){
                $this->db->insert('ot_tokentracks', $userData);
            }
        }

        $this->db->query('UNLOCK TABLES');
    }

    public function opensPerToken( $token, $interval, $limit ){
        $data = null;

        /* Get 10 segments of intervals */
        $startInterval = 0;
        $endInterval = $interval;
        $count = 1;

        while( $count <= $limit ){
            $this->db->where('timestamp >= ', 'UNIX_TIMESTAMP(CURRENT_TIMESTAMP - INTERVAL ' . $count * $interval . ' MINUTE) * 1000', FALSE);

            if( $startInterval ){
                $this->db->where('timestamp <= ', 'UNIX_TIMESTAMP(CURRENT_TIMESTAMP - INTERVAL ' . $startInterval . ' MINUTE) * 1000', FALSE);
            }

            $sql = $this->db->count_all_results('ot_tokentracks');
            // var_dump($sql);

            $data[$count - 1]['interval'] = $count * $interval;
            $data[$count - 1]['counts'] = $sql;

            $startInterval = $count * $interval;
            $count++;
        }

        return $data;
    }

    public function uniqueOpensPerToken( $token, $interval, $limit ){
        $data = null;

        /* Get segments of intervals upto limit */
        $startInterval = 0;
        $endInterval = $interval;
        $count = 1;

        while( $count <= $limit ){
            $this->db->select('tokenId');

            $this->db->where('timestamp >= ', 'UNIX_TIMESTAMP(CURRENT_TIMESTAMP - INTERVAL ' . $count * $interval . ' MINUTE) * 1000', FALSE);

            if( $startInterval ){
                $this->db->where('timestamp <= ', 'UNIX_TIMESTAMP(CURRENT_TIMESTAMP - INTERVAL ' . $startInterval . ' MINUTE) * 1000', FALSE);
            }

            $this->db->distinct();

            $sql = $this->db->get('ot_tokentracks');

            $data[$count - 1]['interval'] = $count * $interval;
            $data[$count - 1]['counts'] = $sql->num_rows();

            $startInterval = $count * $interval;
            $count++;
        }

        return $data;
    }

    public function visitsForToken( $token ){
        $data = null;

        $this->db->select('a.token, b.userIP, b.userAgent, b.requestHeader, b.timestamp');

        $this->db->from('ot_tokentracks as b');
        $this->db->join('ot_tokens as a', 'a.id = b.tokenId');

        $this->db->where('a.token', $token);

        $sql = $this->db->get();
        if( $sql->num_rows() ){
            $data = $sql->result_array();

            for( $id = 0; $id < count($data); $id++ ){
                $data[$id]['requestHeader'] = json_decode($data[$id]['requestHeader'], true);
            }
        }

        return $data;
    }
	
}