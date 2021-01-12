

Class constructor($accountSid : Text; $authToken : Text)
	This:C1470.accountSid:=$accountSid
	This:C1470.authToken:=$authToken
	This:C1470.messages:=cs:C1710.Messages.new(This:C1470)
	
	
Function baseURL()->$url : Text
	// TODO add connectivty
	// ex: api.frankfurt.us1.twilio.com
	
	$url:="https://api.twilio.com/2010-04-01/Accounts/"
	
Function basicAuth()->$header : Text
	$header:="Basic "+This:C1470._base64Encode(This:C1470.accountSid+":"+This:C1470.authToken)
	
Function _base64Encode($input : Text)->$output : Text
	// TODO correct encoding?
	var $blobTmp : Blob
	BASE64 ENCODE:C895($input; $blobTmp)
	$output:=BLOB to text:C555($blobTmp; UTF8 C string:K22:15)
	//$output:=BLOB to text($blobTmp; UTF8 text with length)
	//$output:=BLOB to text($blobTmp; UTF8 text without length)
	//$output:=BLOB to text($blobTmp; Mac C string)
	
	