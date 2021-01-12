//%attributes = {}

$client:=Twilio.Client.new("myid"; "mytoken")

ASSERT:C1129($client._base64Encode("aladdin:sesameOuvreToi")="YWxhZGRpbjpzZXNhbWVPdXZyZVRvaQ==")

$message:=New object:C1471(\
"body"; "This is the ship that made the Kessel Run in fourteen parsecs?'"; \
"from"; "+15017122661"; \
"to"; "+15558675310")

$messageResponse:=$client.messages.create($message)
