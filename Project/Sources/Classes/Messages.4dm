
Class extends Service

Function url()->$url : Text
	$url:=Super:C1706.url()+"/Messages.json"
	
Function sendMessage($from : Text; $to : Text; $body : Text)->$message : cs:C1710.Message
	$message:=This:C1470.create(New object:C1471("from"; $from; "to"; $to; "body"; $body))
	
Function create($messageData : Object)->$message : cs:C1710.Message
	
	var $response : Object
	
	ARRAY TEXT:C222($headerNames; 0)
	ARRAY TEXT:C222($headerValues; 0)
	
	$headerNames{1}:="Authorization"
	$headerValues{1}:=This:C1470.client.basicAuth()
	
	$httpResponse:=HTTP Request:C1158(HTTP POST method:K71:2; This:C1470.url()+"?"+This:C1470.buildQuery($messageData); ""; $response; $headerNames; $headerValues)
	
/*
	curl -X POST https://api.twilio.com/2010-04-01/Accounts/$TWILIO_ACCOUNT_SID/Messages.json \
		--data-urlencode "Body=This is the ship that made the Kessel Run in fourteen parsecs?" \
		--data-urlencode "From=+15017122661" \
		--data-urlencode "To=+15558675310" \
		-u $TWILIO_ACCOUNT_SID:$TWILIO_AUTH_TOKEN
*/
	
	$message:=cs:C1710.Message.new($response)
	