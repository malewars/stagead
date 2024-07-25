```
$..[?(@.worklocid == "{{HttpRequest.AccessToken.LocID}}")]
```

```
#log = @org.apache.commons.logging.LogFactory@getLog("com.pingidentity.ognl.logger"),
#log.debug("****************Starting Search*********************"),
#ldapID="LDAP-99B93B1FB428E27284BE5BD1F183110D3AB60896",
#ldapReturnAttributes = new java.lang.String[1],
#ldapReturnAttributes[0] = "displayNamePrintable",
#ldapBase="DC=example,DC=dev",
#ldapSearchFilter="objectclass=*",
#searchScope=0,
#dataSourceManager = @org.sourceid.saml20.domain.mgmt.MgmtFactory@getDataSourceManager(),
#ldapDataSource = #dataSourceManager.getLdapDataSource(#ldapID),
#countLimit=0,
#ldapResult = #ldapDataSource.getAttributesOfMatchingObjects(ldapBase,ldapSearchFilter,searchScope,ldapReturnAttributes,countLimit),
#i=0,
#ldapResult.{
#log.debug(#ldapResult[#i].toString()),
        #log.debug("i=" + i),
#i=#i+1
},
#log.debug("****************Done*********************"),
#result="done"
```
```
 ./ldapsearch --port 389 --bindDN "cn=Directory Manager" --bindPassword {PWD} \
> --proxyas "uid=mel,ou=People,dc=example,dc=com" --baseDN dc=example,dc=com "(uid=mel)"
# Result Code:  123 (authorization denied)
# Diagnostic Message:  The requested operation requires the proxied-auth privilege
# Number of Entries Returned:  0

HOW TO FIX:

./ldapmodify --filename ./fixpingfed.ldif -h mydir.ping-eng.com -p 389 -D "cn=Directory Manager" -w 2Federate
# Successfully connected to mydir.ping-eng.com:389.

# Adding entry ou=Applications,dc=example,dc=com ...
# Result Code:  0 (success)

# Adding entry uid=PFAdmin,ou=Applications,dc=example,dc=com ...
# Result Code:  0 (success)

# Modifying entry ou=People,dc=example,dc=com ...
# Result Code:  20 (attribute or value exists)
# Diagnostic Message:  Entry ou=People,dc=example,dc=com cannot be modified because it would have resulted in one or more duplicate values for
#      attribute aci

(CONTENTS): 
dn: ou=Applications,dc=example,dc=com
changetype: add
objectClass: top
objectClass: organizationalUnit
objectClass: extensibleObject
ou: Admins
ou: Applications

dn: uid=PFAdmin,ou=Applications,dc=example,dc=com
changetype: add
objectClass: top
objectClass: person
objectClass: organizationalPerson
objectClass: inetOrgPerson
givenName: PingFederate
uid: PFAdmin
cn: PFAdmin
sn: Administrator
userPassword: 2Federate
ds-privilege-name: proxied-auth
ds-privilege-name: password-reset

dn: ou=People,dc=example,dc=com
changetype: modify
add: aci
aci: (version 3.0; acl "People Proxy Access"; allow(proxy) userdn="ldap:///uid=PFAdmin,ou=Applications,dc=example,dc=com";)
```

```
create an implicit PF oauth client and get a token, my url
https://iseestars.freeddns.org:9031/as/authorization.oauth2?response_type=token&redirect_uri=https://decoder.pingidentity.cloud/implicit &client_id=implicitAT&scope=profile

Token:

eyJhbGciOiJSUzI1NiIsImtpZCI6IjEiLCJwaS5hdG0iOiJoczdhIn0.eyJzY29wZSI6InByb2ZpbGUiLCJhdXRob3JpemF0aW9uX2RldGFpbHMiOltdLCJjbGllbnRfaWQiOiJpbXBsaWNpdEFUIiwiaWF0IjoxNjk4NzY2MzgwLCJqdGkiOiJzS040cjc1MTg5d2RvazRpUDdWSVoyIiwibWFpbCI6ImRlbmlzYW1wbGVAbWFpbGluYXRvci5jb20iLCJVc2VybmFtZSI6InRlc3QxIiwiZ2l2ZW5OYW1lIjoicGVyc29uMSIsIm1vYmlsZSI6IisxIDE2NCAyODYgNDkyNCIsInBpLnNyaSI6IlNQNThRUXBfVjlnRFdHUW82TnpuNGVka2JfYyIsInNuIjoiU2FtcGxlIiwidXNlcm5hbWUiOiJ0ZXN0MSIsImV4cCI6MTY5ODc3MzU4MH0.G0CZsoQj7iC5S8TyhUIdIXhjPVqq16Lnnw1z4wky9BPLNaPCrnPndAJjuuLFiK82Qd8-7cUizroB7GNGVgO-NrkEqTfcKOMA98PKcOlu_FZ0yUpSzydu4jJE8xVEOIf5-kFaulkrvOBCIjCkgAkQucrf7RIQ1K7-nl0vsYTTsFYyJKT35hucwSuf6Hkzxj1DsntowVMCd9UQQAyACIY5fvn3q3cY16W6IR7IRdtkDw2h1R-eP4tY3-LFG0p6BOm3053TwTYnpUWDJcBCSqix3JUBbyvYcU5AvWV0KxSIaNEEJJmkSSf9ZTRdYnb_-Q52EzTY9oyTJqT-LJC_2TJb_Q

example call:

export token="eyJhbGciOiJSUzI1NiIsImtpZCI6IjEiLCJwaS5hdG0iOiJoczdhIn0.eyJzY29wZSI6InByb2ZpbGUiLCJhdXRob3JpemF0aW9uX2RldGFpbHMiOltdLCJjbGllbnRfaWQiOiJpbXBsaWNpdEFUIiwiaWF0IjoxNjk4NzY2MzgwLCJqdGkiOiJzS040cjc1MTg5d2RvazRpUDdWSVoyIiwibWFpbCI6ImRlbmlzYW1wbGVAbWFpbGluYXRvci5jb20iLCJVc2VybmFtZSI6InRlc3QxIiwiZ2l2ZW5OYW1lIjoicGVyc29uMSIsIm1vYmlsZSI6IisxIDE2NCAyODYgNDkyNCIsInBpLnNyaSI6IlNQNThRUXBfVjlnRFdHUW82TnpuNGVka2JfYyIsInNuIjoiU2FtcGxlIiwidXNlcm5hbWUiOiJ0ZXN0MSIsImV4cCI6MTY5ODc3MzU4MH0.G0CZsoQj7iC5S8TyhUIdIXhjPVqq16Lnnw1z4wky9BPLNaPCrnPndAJjuuLFiK82Qd8-7cUizroB7GNGVgO-NrkEqTfcKOMA98PKcOlu_FZ0yUpSzydu4jJE8xVEOIf5-kFaulkrvOBCIjCkgAkQucrf7RIQ1K7-nl0vsYTTsFYyJKT35hucwSuf6Hkzxj1DsntowVMCd9UQQAyACIY5fvn3q3cY16W6IR7IRdtkDw2h1R-eP4tY3-LFG0p6BOm3053TwTYnpUWDJcBCSqix3JUBbyvYcU5AvWV0KxSIaNEEJJmkSSf9ZTRdYnb_-Q52EzTY9oyTJqT-LJC_2TJb_Q"

/opt/homebrew/Cellar/curl/8.3.0/bin/curl  -v  http://iseestars.freeddns.org:8000/anything/hkhk --header 'Authorization: Bearer "$token"' --header 'Content-Type: application/json' --data-raw '{
        "data": {
            "type": "game",
            "attributes": {
                "invitees": [
                    "user.99@example.com"
                ]
            }
        }
    }'


< HTTP/1.1 403 Forbidden
< Date: Tue, 31 Oct 2023 16:20:43 GMT
< Content-Type: application/json
< Connection: keep-alive
< Content-Length: 97
< X-Kong-Response-Latency: 359
< Server: kong/3.3.0.0-enterprise-edition
<
* Connection #0 to host iseestars.freeddns.org left intact
{"id":"151b98fb-2eab-4095-87e5-3fbf2a5545d9","code":"UNEXPECTED_ERROR","message":"Access Denied"}%

```
```
1) get a token like:
https://iseestars.freeddns.org:9031/as/authorization.oauth2?response_type=token&redirect_uri=https://decoder.pingidentity.cloud/implicit&client_id=implicitAT&scope=profile
(id:test1/pw:2Federate)

2) grabbed token
```

```
  addEventListener("load", (event) => {
      
      function redirect () {
         var interval = setInterval(myURL, 5000);
         var result = document.getElementById("result");
         result.innerHTML = "<b> The page will redirect after delay of 5 seconds setInterval() method.";
      }

      function myURL() {
         document.location.href = 'https://apps.pingone.com/0d686611-0efa-47c6-ada7-dbbaaf75a96b/myapps/';
         clearInterval(interval);
      }
      
      })
```
```
exec \
     "$JAVA" \
    -Dlogging.config="$GATEWAY_HOME/config/logback.xml" \
    -Dspring.config.additional-location="$GATEWAY_HOME/config/run.properties" \
    -Dlogger.console.level=DEBUG \
    -Dlogger.pingidentity.lightning.level=DEBUG \
    -Dlogger.console.level=DEBUG \
    -Dlogging.allowSensitiveMaterial=true \
    -jar \
    lightning-radius-gateway.jar
```

```
https://github.com/cprice-ping/PingConfigurator

./curl --location --request POST 'https://auth.pingone.com/0d686611-0efa-47c6-ada7-dbbaaf75a96b/as/token' \
--header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'client_id=9e65d2b7-0ca6-48eb-bd89-c2ce58dc385a' \
--data-urlencode 'client_secret=m6TNQShtvFPoi9W_CjPyVpv~yvRY6RN48wsEZqDzBGSCNFCEOlamjyqu-sQKZtnD' \
--data-urlencode 'grant_type=client_credentials'

https://auth.pingone.com/0d686611-0efa-47c6-ada7-dbbaaf75a96b/davinci/flows/039197bf69e10a40ad13098c70f82b11/authorize?client_id=tryFlow&response_type=code&scope=openid&redirect_uri=https://auth.pingone.com/0d686611-0efa-47c6-ada7-dbbaaf75a96b/davinci/testrp&tryFlowToken=00fe9b75-d422-4428-a305-4db337131a87
```


