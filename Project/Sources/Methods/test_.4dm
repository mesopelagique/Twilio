//%attributes = {}


$config:=JSON Parse:C1218(Folder:C1567(fk resources folder:K87:11).file("twilio.test.json").getText())
$client:=Twilio.Client.new($config.accountSid; $config.authToken)

// test base64
ASSERT:C1129($client._base64Encode("aladdin:sesameOuvreToi")="YWxhZGRpbjpzZXNhbWVPdXZyZVRvaQ==")

// test urlencode
var $input : Text
For each ($input; New collection:C1472("+33670941571"; "Luke, I am Your Father"))
	
	var $urlEncoded; $phpUrlEncoded : Text
	var $b : Boolean
	$b:=PHP Execute:C1058(""; "urlencode"; $phpUrlEncoded; $input)
	
	$urlEncoded:=$client.messages.urlEncode($input)
	ASSERT:C1129($phpUrlEncoded=$urlEncoded; $urlEncoded+" not "+$phpUrlEncoded)
End for each 

// test message
// https://www.twilio.com/docs/iam/test-credentials#test-sms-messages

$message:=New object:C1471(\
"Body"; "This is the ship that made the Kessel Run in fourteen parsecs?"; \
"From"; "+15005550006"; \
"To"; "+15005550006")

$messageResponse:=$client.messages.create($message)

ASSERT:C1129($messageResponse.code=201)

$message:=New object:C1471(\
"Body"; "This is the ship that made the Kessel Run in fourteen parsecs?"; \
"From"; "+15005550006"; \
"To"; "+15558675310")

$messageResponse:=$client.messages.create($message)

ASSERT:C1129($messageResponse.code=400)

