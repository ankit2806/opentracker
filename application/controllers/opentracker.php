<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class OpenTracker extends CI_Controller {

	public function __construct(){
		parent::__construct();

		$this->load->model('opentracker_model');
		$this->server = 'http://localhost';
		$this->limit = 10;
	}

	private function getUniqueToken(){
		return uniqid('', TRUE);
	}

	/**
	 *	@apiDescription Fetch New Token
	 * The API response will be a URL with token target.
	 * The 'status' field will be either "true" or true or "false" or false.
	 * The 'response' field will either contain the message to be shown to the user or the data as described below.
	 *
	 *	@apiGroup OpenTracker
	 *
	 *	@apiName fetchNewToken
	 *
	 *	@api {post} opentracket/fetchNewToken
	 *
	 *	@apiSuccess {String} url		Target URL with token
	 */
	public function fetchNewToken(){
		$this->output->set_content_type('application/json');
		$json_data = array(
			'status' => FALSE,
			'response' => null
		);

		while( true ){
			$token = $this->getUniqueToken();
			
			$isExist = $this->opentracker_model->checkInsertTokenInDB( $token );
			if( !$isExist ){
				$json_data['response']['url'] = $this->server . '/directi/index.php/opentracker/trackToken/' . $token;
				break;
			}
		}

		$result = json_encode($json_data, JSON_FORCE_OBJECT);
		$this->output->set_output($result);
	}

	/**
	 *	@apiDescription Track Token
	 * The API response will be a URL with token target.
	 * The 'status' field will be either "true" or true or "false" or false.
	 * The 'response' field will either contain the message to be shown to the user or the data as described below.
	 *
	 *	@apiGroup OpenTracker
	 *
	 *	@apiName trackToken
	 *
	 *	@api {get} opentracket/trackToken
	 *
	 *	@apiParam {String} token
	 *
	 *	@apiSuccess None User will be redirected.
	 */
	public function trackToken( $token = null ){

		$userData = array(
			'userIP' => $this->input->ip_address(),
			'userAgent' => $this->input->user_agent(),
			'requestHeader' => json_encode(getallheaders(), true)
		);

		$this->opentracker_model->insertTrackToken( $token, $userData);

		header('Location: https://media-net.github.io');
	}

	/**
	 *	@apiDescription Opens For A Token
	 * The API response will be a URL with token target.
	 * The 'status' field will be either "true" or true or "false" or false.
	 * The 'response' field will either contain the message to be shown to the user or the data as described below.
	 *
	 *	@apiGroup OpenTracker
	 *
	 *	@apiName opensPerToken
	 *
	 *	@api {get} opentracket/opensPerToken
	 *
	 *	@apiParam {String} token
	 *	@apiParam {String} interval
	 *
	 *	@apiSuccess {String} data 	JSON Object containg the intervals and relative counts
	 */
	public function opensPerToken(){
		$this->output->set_content_type('application/json');
		$json_data = array(
			'status' => TRUE,
			'response' => null
		);

		$token = $this->input->get('token', true);
		$interval = $this->input->get('interval', true);

		$json_data['response']['data'] = $this->opentracker_model->opensPerToken( $token, $interval, $this->limit );

		$result = json_encode($json_data, JSON_FORCE_OBJECT);
		$this->output->set_output($result);
	}

	/**
	 *	@apiDescription Unique Opens For A Token
	 * The API response will be a URL with token target.
	 * The 'status' field will be either "true" or true or "false" or false.
	 * The 'response' field will either contain the message to be shown to the user or the data as described below.
	 *
	 *	@apiGroup OpenTracker
	 *
	 *	@apiName uniqueOpensPerToken
	 *
	 *	@api {get} opentracket/uniqueOpensPerToken
	 *
	 *	@apiParam {String} token
	 *	@apiParam {String} interval
	 *
	 *	@apiSuccess {String} data 	JSON Object containg the intervals and relative counts
	 */
	public function uniqueOpensPerToken(){
		$this->output->set_content_type('application/json');
		$json_data = array(
			'status' => TRUE,
			'response' => null
		);

		$token = $this->input->get('token', true);
		$interval = $this->input->get('interval', true);

		$json_data['response']['data'] = $this->opentracker_model->uniqueOpensPerToken( $token, $interval, $this->limit );

		$result = json_encode($json_data, JSON_FORCE_OBJECT);
		$this->output->set_output($result);
	}

	/**
	 *	@apiDescription Visits Data For A Token
	 * The API response will be a URL with token target.
	 * The 'status' field will be either "true" or true or "false" or false.
	 * The 'response' field will either contain the message to be shown to the user or the data as described below.
	 *
	 *	@apiGroup OpenTracker
	 *
	 *	@apiName visitsForToken
	 *
	 *	@api {get} opentracket/visitsForToken
	 *
	 *	@apiParam {String} token
	 *	@apiParam {String} interval
	 *
	 *	@apiSuccess {String} data 	JSON Object containg the intervals and relative counts
	 */
	public function visitsForToken(){
		$this->output->set_content_type('application/json');
		$json_data = array(
			'status' => TRUE,
			'response' => null
		);

		$token = $this->input->get('token', true);

		$json_data['response']['data'] = $this->opentracker_model->visitsForToken( $token );

		$result = json_encode($json_data, JSON_FORCE_OBJECT);
		$this->output->set_output($result);
	}
}

/* End of file opentracker.php */
/* Location: ./application/controllers/opentracker.php */