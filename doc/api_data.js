define({ "api": [
  {
    "description": "<p>Fetch New Token The API response will be a URL with token target. The 'status' field will be either &quot;true&quot; or true or &quot;false&quot; or false. The 'response' field will either contain the message to be shown to the user or the data as described below.</p>",
    "group": "OpenTracker",
    "name": "fetchNewToken",
    "type": "post",
    "url": "opentracket/fetchNewToken",
    "title": "",
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "url",
            "description": "<p>Target URL with token</p>"
          }
        ]
      }
    },
    "version": "0.0.0",
    "filename": "application/controllers/opentracker.php",
    "groupTitle": "OpenTracker"
  },
  {
    "description": "<p>Opens For A Token The API response will be a URL with token target. The 'status' field will be either &quot;true&quot; or true or &quot;false&quot; or false. The 'response' field will either contain the message to be shown to the user or the data as described below.</p>",
    "group": "OpenTracker",
    "name": "opensPerToken",
    "type": "get",
    "url": "opentracket/opensPerToken",
    "title": "",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "token",
            "description": ""
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "interval",
            "description": ""
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "data",
            "description": "<p>JSON Object containg the intervals and relative counts</p>"
          }
        ]
      }
    },
    "version": "0.0.0",
    "filename": "application/controllers/opentracker.php",
    "groupTitle": "OpenTracker"
  },
  {
    "description": "<p>Track Token The API response will be a URL with token target. The 'status' field will be either &quot;true&quot; or true or &quot;false&quot; or false. The 'response' field will either contain the message to be shown to the user or the data as described below.</p>",
    "group": "OpenTracker",
    "name": "trackToken",
    "type": "get",
    "url": "opentracket/trackToken",
    "title": "",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "token",
            "description": ""
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "optional": false,
            "field": "None",
            "description": "<p>User will be redirected.</p>"
          }
        ]
      }
    },
    "version": "0.0.0",
    "filename": "application/controllers/opentracker.php",
    "groupTitle": "OpenTracker"
  },
  {
    "description": "<p>Unique Opens For A Token The API response will be a URL with token target. The 'status' field will be either &quot;true&quot; or true or &quot;false&quot; or false. The 'response' field will either contain the message to be shown to the user or the data as described below.</p>",
    "group": "OpenTracker",
    "name": "uniqueOpensPerToken",
    "type": "get",
    "url": "opentracket/uniqueOpensPerToken",
    "title": "",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "token",
            "description": ""
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "interval",
            "description": ""
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "data",
            "description": "<p>JSON Object containg the intervals and relative counts</p>"
          }
        ]
      }
    },
    "version": "0.0.0",
    "filename": "application/controllers/opentracker.php",
    "groupTitle": "OpenTracker"
  },
  {
    "description": "<p>Visits Data For A Token The API response will be a URL with token target. The 'status' field will be either &quot;true&quot; or true or &quot;false&quot; or false. The 'response' field will either contain the message to be shown to the user or the data as described below.</p>",
    "group": "OpenTracker",
    "name": "visitsForToken",
    "type": "get",
    "url": "opentracket/visitsForToken",
    "title": "",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "token",
            "description": ""
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "interval",
            "description": ""
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "data",
            "description": "<p>JSON Object containg the intervals and relative counts</p>"
          }
        ]
      }
    },
    "version": "0.0.0",
    "filename": "application/controllers/opentracker.php",
    "groupTitle": "OpenTracker"
  }
] });
