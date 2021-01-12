# Twilio

Use [twilio](https://www.twilio.com/) REST API to send SMS

IN PROGRESS

## Usage

```4d
$client:=Twilio.Client.new("TWILIO_ACCOUNT_SID"; "TWILIO_AUTH_TOKEN")

$message:=New object(\
"body"; "This is the ship that made the Kessel Run in fourteen parsecs?'"; \
"from"; "+15017122661"; \
"to"; "+15558675310")

$client.messages.create($message)
```

## TODO

- urlEncode
- test it

## DOC

API Documentation https://www.twilio.com/docs/sms/api

## Alterative

Use `PHP Execute`, example: https://github.com/jay-jay/4D-Twilio
