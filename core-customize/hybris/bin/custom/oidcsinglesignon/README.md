# oidcsinglesignon
openid connect sso poc extension.

this extension uses mlc2 idp server of asiamiles for testing purpose.

Use guide:
<br/>
clone the extension into commerce custom folder, then enable it in localextension.xml

```Bash
<extension name="oidcsinglesignon" />

```

install asm module

ant clean all and start server

trigger sso basic flow:

```
https://127.0.0.1:9002/oidcsinglesignon/oidc/piwiktrackingstorefront/electronics/en/?site=electronics&asm=true
https://127.0.0.1:9002/oidcsinglesignon/oidc/backoffice

```
login with testing user: 1920108079/Abcd!1234

have fun!
