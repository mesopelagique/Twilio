# Twilio
[![language][code-shield]][code-url]
[![language-top][code-top]][code-url]
![code-size][code-size]
[![release][release-shield]][release-url]
[![license][license-shield]][license-url]
[![discord][discord-shield]][discord-url]

Use [Twilio](https://www.twilio.com/referral/NqfrgQ) REST API to send SMS

## Usage

```4d
$client:=Twilio.Client.new("TWILIO_ACCOUNT_SID"; "TWILIO_AUTH_TOKEN")

$message:=New object(\
"body"; "This is the ship that made the Kessel Run in fourteen parsecs?'"; \
"from"; "+15017122661"; \
"to"; "+15558675310")

$client.messages.create($message)
```

## DOC

API Documentation https://www.twilio.com/docs/sms/api

## Alterative

Use `PHP Execute`, example: https://github.com/jay-jay/4D-Twilio

## Other components

[<img src="https://mesopelagique.github.io/quatred.png" alt="mesopelagique"/>](https://mesopelagique.github.io/)

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[code-shield]: https://img.shields.io/static/v1?label=language&message=4d&color=blue
[code-top]: https://img.shields.io/github/languages/top/mesopelagique/Twilio.svg
[code-size]: https://img.shields.io/github/languages/code-size/mesopelagique/Twilio.svg
[code-url]: https://developer.4d.com/
[release-shield]: https://img.shields.io/github/v/release/mesopelagique/Twilio
[release-url]: https://github.com/mesopelagique/Twilio/releases/latest
[license-shield]: https://img.shields.io/github/license/mesopelagique/Twilio
[license-url]: LICENSE.md
[discord-shield]: https://img.shields.io/badge/chat-discord-7289DA?logo=discord&style=flat
[discord-url]: https://discord.gg/dVTqZHr
