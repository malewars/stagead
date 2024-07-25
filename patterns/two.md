```
curl --location --request GET '{{global.company.variables.PingOne API Base}}/environments/{{global.company.variables.PingOne Reseller EnvID}}/populations' \ --header 'Authorization:Bearer {{local.vtktoj16dw.payload.output.rawResponse.body.access_token}}' \ 


https://auth.pingone.com/0d686611-0efa-47c6-ada7-dbbaaf75a96b/davinci/flows/8d9dbacc8966ae546f6f107e7db44e56/authorize?client_id=tryFlow&response_type=code&scope=openid&redirect_uri=https://auth.pingone.com/0d686611-0efa-47c6-ada7-dbbaaf75a96b/davinci/testrp&tryFlowToken=0086793b-df49-45c9-b3d7-edc2e5aefe79


https://auth.pingone.com/0d686611-0efa-47c6-ada7-dbbaaf75a96b/davinci/flows/ad060bbaaab9a3e36be38f83deb1090d/authorize?client_id=tryFlow&response_type=code&scope=openid&redirect_uri=https://auth.pingone.com/0d686611-0efa-47c6-ada7-dbbaaf75a96b/davinci/testrp&tryFlowToken=0086793b-df49-45c9-b3d7-edc2e5aefe79

curl --location --request POST 'https://auth.pingone.com/{{global.companyId}}/as/token' \ --header 'Content-Type: application/x-www-form-urlencoded' \ --data-urlencode 'client_id={{global.company.variables.p1ClientId}}' \ --data-urlencode 'client_secret={{global.company.variables.p1ClientSecret}}' \ --data-urlencode 'grant_type=client_credentials' \ 


```

call google calendar api
```
https://auth.pingone.com/0d686611-0efa-47c6-ada7-dbbaaf75a96b/davinci/oauth2/callback?code=4%2F0AVHEtk7Cu6iK5XQTqOxhEWJ5yaAO-nvP5VRP_nlA4ch8OR2UEqa_D-8KbEgdSBrQRkgVzw&scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fcalendar
```

```ognl
#domainprefix="Canes",
#i = 0;
#groups = #this.get("memberOf")!=null?#this.get("memberOf").getValues():{},
#groups.{
   #group = #this,
   #group = new javax.naming.ldap.LdapName(#group),
   #cn = #group.getRdn(#group.size() - 1).getValue().toString(),
   #canescn = #domainprefix.toString()+"\\"+#cn.toString(),
   #canesgrps = #canescn.toString().replaceAll("^Canes.*Everyone","Everyone"),
   #xmlAttr = #AttrArray.addNewAttribute(),
   #xmlAttr.setName("role"),
   #xmlAttr.setNameFormat("urn:oasis:names:tc:SAML:2.0:attrname-format:basic"),
   #xmlVal = #xmlAttr.addNewAttributeValue(),
   #xmlVal.set(#canesgrps)
},
#result="done"

```

```
curl -k -H 'Content-Type: application/x-www-form-urlencoded' -d 'grant_type=urn%3Aietf%3Aparams%3Aoauth%3Agrant-type%3Ajwt-bearer&assertion=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJPbmxpbmUgSldUIEJ1aWxkZXIiLCJpYXQiOjE2NTcxMzA3NDgsImV4cCI6MTY4ODY2Njc0OCwiYXVkIjoid3d3LmV4YW1wbGUuY29tIiwic3ViIjoianJvY2tldEBleGFtcGxlLmNvbSIsImZpcnN0bmFtZSI6IkpvaG5ueSIsImxhc3RuYW1lIjoiUm9ja2V0IiwibWFpbCI6Impyb2NrZXRAZXhhbXBsZS5jb20iLCJSb2xlIjpbIk1hbmFnZXIiLCJQcm9qZWN0IEFkbWluaXN0cmF0b3IiXX0.8aktCdqecZ1xbSvDXYq6DJ0lvoZN_BI_YsCu9-otBEg&client_id=TestInboundJWT&access_token_manager_id=TestInboundJWT&connectionid=TestInboundJWT' https://sso.ping-eng.com:9031/as/token.oauth2
curl -k -H 'Content-Type: application/x-www-form-urlencoded' -d 'grant_type=urn%3Aietf%3Aparams%3Aoauth%3Agrant-type%3Ajwt-bearer&assertion=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJUZXN0SW5ib3VuZEpXVCIsImlhdCI6MTY1NzE2NDk4MiwiZXhwIjoxNjg4NzAwOTgyLCJhdWQiOiJ3d3cuZXhhbXBsZS5jb20iLCJzdWIiOiJqcm9ja2V0QGV4YW1wbGUuY29tIiwiZmlyc3RuYW1lIjoiSm9obm55IiwibGFzdG5hbWUiOiJSb2NrZXQiLCJtYWlsIjoianJvY2tldEBleGFtcGxlLmNvbSIsIlJvbGUiOlsiTWFuYWdlciIsIlByb2plY3QgQWRtaW5pc3RyYXRvciJdfQ.UCO-n3dUC_c1Qg8QAgsWQ_QC1eiLtv6OtZi-jT9qUMU&client_id=TestInboundJWT&access_token_manager_id=TestInboundJWT&connectionid=TestInboundJWT' https://sso.ping-eng.com:9031/as/token.oauth2

eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJUZXN0SW5ib3VuZEpXVCIsImlhdCI6MTY1NzE2NDk4MiwiZXhwIjoxNjg4NzAwOTgyLCJhdWQiOiJ3d3cuZXhhbXBsZS5jb20iLCJzdWIiOiJqcm9ja2V0QGV4YW1wbGUuY29tIiwiZmlyc3RuYW1lIjoiSm9obm55IiwibGFzdG5hbWUiOiJSb2NrZXQiLCJtYWlsIjoianJvY2tldEBleGFtcGxlLmNvbSIsIlJvbGUiOlsiTWFuYWdlciIsIlByb2plY3QgQWRtaW5pc3RyYXRvciJdfQ.UCO-n3dUC_c1Qg8QAgsWQ_QC1eiLtv6OtZi-jT9qUMUCHANGED TO USING A CERTIFICATE NOT SYNC HMAC ANYMORE!
eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJUZXN0SW5ib3VuZEpXVCIsImlhdCI6MTY1NzE2NDk4MiwiZXhwIjoxNjg4NzAwOTgyLCJhdWQiOiJ3d3cuZXhhbXBsZS5jb20iLCJzdWIiOiJqcm9ja2V0QGV4YW1wbGUuY29tIiwiZmlyc3RuYW1lIjoiSm9obm55IiwibGFzdG5hbWUiOiJSb2NrZXQiLCJtYWlsIjoianJvY2tldEBleGFtcGxlLmNvbSIsIlJvbGUiOlsiTWFuYWdlciIsIlByb2plY3QgQWRtaW5pc3RyYXRvciJdfQ.DpZPokuGQqAB1Tmic-6qSQAUdnfB7WYZupool9tikhesjTgHkzH_noYffG93rKGWTXWAh44gqcgoV72qlXPpxebcw-Z8cVRfdtuRUV0qZQmPcCtKa62U47kD0sIak93qnzjsx7fsf6_HPTWgNpcgR1rIHkscHRolUfP3Vgn-w_-mAxx_kybD3VItk-nAs4dlzNA0e0Fai9rYnh7Cp1kb2hOOebr4Vky-X47kLj-Cn3n9mwKmsUXZjJvtO1q5y0VzOsZ_rzN7Mi5ZshfXR_vucl6iqQHtvo2xAqYa8UqneUS0LamSooEsLdocq04ZcziXNiv_tqmeRJd0piOm5XNu8Q


eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJUZXN0SW5ib3VuZEpXVCIsImlhdCI6MTY1NzE2NDk4MiwiZXhwIjoxNjg4NzAwOTgyLCJhdWQiOiJ3d3cuZXhhbXBsZS5jb20iLCJzdWIiOiJqcm9ja2V0QGV4YW1wbGUuY29tIiwiZmlyc3RuYW1lIjoiSm9obm55IiwibGFzdG5hbWUiOiJSb2NrZXQiLCJtYWlsIjoianJvY2tldEBleGFtcGxlLmNvbSIsIlJvbGUiOlsiTWFuYWdlciIsIlByb2plY3QgQWRtaW5pc3RyYXRvciJdfQ.DpZPokuGQqAB1Tmic-6qSQAUdnfB7WYZupool9tikhesjTgHkzH_noYffG93rKGWTXWAh44gqcgoV72qlXPpxebcw-Z8cVRfdtuRUV0qZQmPcCtKa62U47kD0sIak93qnzjsx7fsf6_HPTWgNpcgR1rIHkscHRolUfP3Vgn-w_-mAxx_kybD3VItk-nAs4dlzNA0e0Fai9rYnh7Cp1kb2hOOebr4Vky-X47kLj-Cn3n9mwKmsUXZjJvtO1q5y0VzOsZ_rzN7Mi5ZshfXR_vucl6iqQHtvo2xAqYa8UqneUS0LamSooEsLdocq04ZcziXNiv_tqmeRJd0piOm5XNu8Q

eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJUZXN0SW5ib3VuZEpXVCIsImlhdCI6MTY1NzE2NDk4MiwiZXhwIjoxNjU3MjAwNjc1LCJhdWQiOiJodHRwczovL3Nzby5waW5nLWVuZy5jb20iLCJzY29wZSI6InByb2ZpbGUgb3BlbmlkIiwic3ViIjoianJvY2tldEBleGFtcGxlLmNvbSIsImZpcnN0bmFtZSI6IkpvaG5ueSIsImxhc3RuYW1lIjoiUm9ja2V0IiwibWFpbCI6Impyb2NrZXRAZXhhbXBsZS5jb20iLCJSb2xlIjpbIk1hbmFnZXIiLCJQcm9qZWN0IEFkbWluaXN0cmF0b3IiXX0.Lds1Lv3-K84pUc9NBYjYm7GXY21tQ56WVPsjXc89RiOmEIM0AOKQJWJT_0WIEtM1Q_jtkcKPs-w_qFqcVF4NmmIqVw8qKYtiWeN4dV42PzHiEwbkCXndiBMDN7F-cNEmZwG_IjOKDrezMBmhkXozk0drh_H2jRSp1pSLpqqmIU3pzooj9L_1conhSp5RKlXxcPKGY7K3QQW8gGMHtkcpr-cYOA5RngSqLfoRJZFmSSeyA-Xj5-iTqK9oqKlWXCyF48HyCaNxNxIMsQ_l1tdibG8O3Wqx6WPpuMtIGhLcITSg3dzzzgLGoHYe3cVNwQKPY-B8thYSz92ldQ8aqbeM2A

NEW:
curl -k -H 'Content-Type: application/x-www-form-urlencoded' -d 'grant_type=urn%3Aietf%3Aparams%3Aoauth%3Agrant-type%3Ajwt-bearer&assertion=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJUZXN0SW5ib3VuZEpXVCIsImlhdCI6MTY1NzE2NDk4MiwiZXhwIjoxNjU3MjAwNjc1LCJhdWQiOiJodHRwczovL3Nzby5waW5nLWVuZy5jb20iLCJzY29wZSI6InByb2ZpbGUgb3BlbmlkIiwic3ViIjoianJvY2tldEBleGFtcGxlLmNvbSIsImZpcnN0bmFtZSI6IkpvaG5ueSIsImxhc3RuYW1lIjoiUm9ja2V0IiwibWFpbCI6Impyb2NrZXRAZXhhbXBsZS5jb20iLCJSb2xlIjpbIk1hbmFnZXIiLCJQcm9qZWN0IEFkbWluaXN0cmF0b3IiXX0.Lds1Lv3-K84pUc9NBYjYm7GXY21tQ56WVPsjXc89RiOmEIM0AOKQJWJT_0WIEtM1Q_jtkcKPs-w_qFqcVF4NmmIqVw8qKYtiWeN4dV42PzHiEwbkCXndiBMDN7F-cNEmZwG_IjOKDrezMBmhkXozk0drh_H2jRSp1pSLpqqmIU3pzooj9L_1conhSp5RKlXxcPKGY7K3QQW8gGMHtkcpr-cYOA5RngSqLfoRJZFmSSeyA-Xj5-iTqK9oqKlWXCyF48HyCaNxNxIMsQ_l1tdibG8O3Wqx6WPpuMtIGhLcITSg3dzzzgLGoHYe3cVNwQKPY-B8thYSz92ldQ8aqbeM2A&client_id=TestInboundJWT&access_token_manager_id=TestInboundJWT&connectionid=TestInboundJWT' https://sso.ping-eng.com:9031/as/token.oauth2


-----PARAMETERS---grant_type:   urn:ietf:params:oauth:grant-type:jwt-bearerconnectionid:   TestInboundJWTassertion:   eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJPbmxpbmUgSldUIEJ1aWxkZXIiLCJpYXQiOjE2NTcxMzA3NDgsImV4cCI6MTY4ODY2Njc0OCwiYXVkIjoid3d3LmV4YW1wbGUuY29tIiwic3ViIjoianJvY2tldEBleGFtcGxlLmNvbSIsImZpcnN0bmFtZSI6IkpvaG5ueSIsImxhc3RuYW1lIjoiUm9ja2V0IiwibWFpbCI6Impyb2NrZXRAZXhhbXBsZS5jb20iLCJSb2xlIjpbIk1hbmFnZXIiLCJQcm9qZWN0IEFkbWluaXN0cmF0b3IiXX0.8aktCdqecZ1xbSvDXYq6DJ0lvoZN_BI_YsCu9-otBEgclient_id:   TestInboundJWT
2022-07-06 23:30:47,389 tid:yegigaLInRlHzzGlxLaDLziqeFA DEBUG [org.sourceid.saml20.bindings.BindingFactory] POST with Params: [connectionid, assertion, grant_type, client_id] assume binding: oauth:token-endpoint from: 192.168.86.40 Referer: null AuthType: null Content-Type: application/x-www-form-urlencoded2022-07-06 23:30:47,389 tid:yegigaLInRlHzzGlxLaDLziqeFA DEBUG [org.sourceid.saml20.bindings.LoggingInterceptor] Received InMessageContext:InMessageContextentityId: TestInboundJWT (null)virtualServerId: nullBinding: oauth:token-endpointparams: {aud=null, grant_type=urn:ietf:params:oauth:grant-type:jwt-bearer, access_token_manager_id=null, scope=null, token=*****}
2022-07-06 23:30:47,390 tid:yegigaLInRlHzzGlxLaDLziqeFA DEBUG [org.sourceid.oauth20.handlers.TokenEndpointRequestHandler] Handling normal exception condition in token endpoint: org.sourceid.oauth20.handlers.AccessTokenRequestException: invalid_grant: Token issuer Online JWT Builder does not match an active IdP connection.2022-07-06 23:30:47,390 tid:yegigaLInRlHzzGlxLaDLziqeFA DEBUG [org.sourceid.servlet.HttpServletRespProxy] flush cookies: adding Cookie{PF=hashedValue:yegigaLInRlHzzGlxLaDLziqeFA; path=/; maxAge=-1; domain=null}2022-07-06 23:30:47,390 tid:yegigaLInRlHzzGlxLaDLziqeFA DEBUG [org.sourceid.saml20.bindings.LoggingInterceptor] Transported Response. OutMessageContext:OutMessageContextentityId: TestInboundJWT (null)virtualServerId: nullBinding: oauth:token-endpointparams: {error=invalid_grant, error_description=Token issuer Online JWT Builder does not match an active IdP connection.}SignaturePolicy: BINDING_DEFAULT
2022-07-06 23:30:53,837  DEBUG [com.pingidentity.common.util.timers.EventTimer] DSEventTimer{dataStoreName='mydir.ping-eng.com', dataStoreType='LDAP', dataStoreUsedBy='directory-driver', eventType='search', timeSpentMs='7019'}2
```

```
All Steps worked like the following:

ssh -i ~/.ssh/FARM-1486-341f336d.us-west-2.pem ec2-user@10.101.34.235
The authenticity of host '10.101.34.235 (10.101.34.235)' can't be established.
ED25519 key fingerprint is SHA256:kYyIny4KIGC8YGeQBe3Qr19w8ItaKPxBOuK2w4LWcHE.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Last login: Fri Nov 27 00:14:16 2020 from 10.98.221.250

sudo su -
 yum install java-11-openjdk.x86_64

Last metadata expiration check: 0:32:57 ago on Wed 15 Jun 2022 05:09:22 PM UTC.
Module yaml error: Unexpected key in data: static_context [line 9 col 3]
Module yaml error: Unexpected key in data: static_context [line 9 col 3]
Dependencies resolved.
Is this ok [y/N]: y
Complete!

/usr/sbin/alternatives --config java

There is 1 program that provides 'java'.

 Selection   Command
-----------------------------------------------
*+ 1          java-11-openjdk.x86_64 (/usr/lib/jvm/java-11-openjdk-11.0.15.0.10-2.el8_6.x86_64/bin/java)

Enter to keep the current selection[+], or type selection number: 1

NEXT ADD A NEW JDK HOME ENV FILE

cat >> /etc/profile.d/jdk_home.sh
#!/bin/sh

export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-11.0.15.0.10-2.el8_6.x86_64/
export PATH=$JAVA_HOME/bin:$PATH
(HIT CONTROL-D)

chmod 755 /etc/profile.d/jdk_home.sh

CREATED NEW USER
 adduser pingdir
 mkdir /usr/local/PingIdentity
 cd /usr/local/PingIdentity
 curl -f -o pingdir8.zip https://webmldemo.freeddns.org/pingdirectory8306.zip

 % Total   % Received % Xferd Average Speed  Time   Time    Time Current
                                Dload Upload  Total  Spent   Left Speed
100 186M 100 186M   0    0 15.1M     0 0:00:12 0:00:12 --:--:-- 14.8M

 unzip pingdir8.zip
 chown -R pingdir:pingdir PingDirectory/
 su - pingdir
 cd /usr/local/PingIdentity/PingDirectory/
 source /etc/profile.d/jdk_home.sh
 echo $JAVA_HOME
/usr/lib/jvm/java-11-openjdk-11.0.15.0.10-2.el8_6.x86_64/

CREATE THE LICENSE FILE

 cat > /tmp/pingdirectory8.1593929.development.lic
ID=00390041
Product=PingDirectory
Version=8.3
EnforcementType=0
Tier=Free
IssueDate=2022-06-13
DeploymentMethod=Traditional
SignCode=7F
Signature=302D0215008E3D034988F0160CCAA11E2F991ECBD02DB0A14402144EF3593367FF0B461C7E57287856FEDD62737960
(HIT CONTROL-D)

INSTALL PINGDIRECTORY

 ./setup --acceptLicense --no-prompt --script-friendly --licenseKeyFile /tmp/pingdirectory8.1593929.development.lic --localHostName $HOSTNAME --ldapPort 2389 --ldapsPort 2636 --httpsPort 2443 --rootUserDN cn=dmanager --rootUserPassword PingDirectory2 --maxHeapSize 768m --enableStartTLS --generateSelfSignedCertificate --instanceName ds2 --location Scalr --baseDN dc=example,dc=com --sampleData 10000

Ping Identity Directory Server 8.3.0.6

Initializing ..... Done
Configuring Directory Server .....

Server tools will be configured with a minimal heap size due to limited system memory available. If out of memory errors occur, it will be necessary to increase tool memory settings in java.properties and run
dsjavaproperties for the changes to take effect.

Configuring Directory Server ..... Done
Configuring Certificates ..... Done
Importing Automatically-Generated Data (10000 Entries) ............. Done
Starting Directory Server ..... Done


OPTIONAL: See if it started:
 ps -ef | grep -i ping

root       7000   6265 0 17:48 pts/0   00:00:00 su - pingdir
pingdir    7001   7000 0 17:48 pts/0   00:00:00 -bash
pingdir    7727      1 85 17:53 pts/0   00:00:57 /usr/lib/jvm/java-11-openjdk-11.0.15.0.10-2.el8_6.x86_64/bin/java -Xmx768m -Xms768m -XX:MaxNewSize=64m -XX:NewSize=64m -XX:+UseBiasedLocking -XX:-OmitStackTraceInFastThrow -XX:MaxTenuringThreshold=2 -XX:+HeapDumpOnOutOfMemoryError -Djdk.tls.ephemeralDHKeySize=2048 -Djava.security.egd=file:/dev/./urandom -XX:+UseG1GC -XX:InitiatingHeapOccupancyPercent=80 -XX:ConcGCThreads=1 --add-opens java.base/java.io=ALL-UNNAMED --add-opens java.base/java.lang=ALL-UNNAMED --add-opens java.base/java.lang.invoke=ALL-UNNAMED --add-opens java.base/java.lang.reflect=ALL-UNNAMED --add-opens java.base/java.security=ALL-UNNAMED --add-opens java.base/java.text=ALL-UNNAMED --add-opens java.base/java.util=ALL-UNNAMED --add-opens java.base/java.util.concurrent.atomic=ALL-UNNAMED --add-opens java.desktop/java.awt.font=ALL-UNNAMED --add-opens java.management/sun.management=ALL-UNNAMED --add-opens jdk.crypto.cryptoki/sun.security.pkcs11=ALL-UNNAMED -Dcom.unboundid.crypto.DEFAULT_KEY_STORE_TYPE=JKS -Djava.security.egd=file:/dev/./urandom -Xlog:gc*:file=/usr/local/PingIdentity/PingDirectory/logs/jvm/gc.log:time,uptime,level,tags:filecount=3,filesize=100m -Dcom.unboundid.directory.server.scriptName=start-server com.unboundid.directory.server.core.DirectoryServer --configClass com.unboundid.directory.server.extensions.ConfigFileHandler --configFile /usr/local/PingIdentity/PingDirectory/config/config.ldif
```

```
curl -X POST \
-H "Authorization: Bearer "$(gcloud auth application-default print-access-token) \
-H "Content-Type: application/json; charset=utf-8" \
-d @request.json \
"https://translation.googleapis.com/language/translate/v2 "

POSTMAN:https://github.com/pingidentity/Postman-Calls/tree/master/PingID
https://github.com/pingidentity/Postman-Calls/blob/master/PingID/pingid.postman_collection.json

Sumo API client: f593a03c-fb6a-4ca8-8366-254ef9cd4d9eSecret: q465dJG9pCtBxzGXkGYmTequGOU1J79eUchqlX6A99qbDKvl7iGiBcmBpkp0DW40FToken URL: https://admin-api.pingone.com/latest/as/token.oauth2

POLL URL https://admin-api.pingone.com/v3/reports/6f8ca999%2Dfacf%2D425c%2D8ab7%2Dcff69c4e18bb/poll%2Dsubscriptions/9aee4e9f%2Dfbce%2D433b%2D8b76%2D0a26abc63653/events



add chrome to ubuntu,
$ sudo apt update
$ sudo apt install chromium-browser

ssh -i jj ec2-user@52.35.121.29 'cd /opt/PingFedLab/ && tar cf - home | gzip -9' > /tmp/home.tar.gz


UTM RESIZE DISK:
I am running QEMU using UTM on my M1 mac, and the .qcow2 files get put somewhere deep in the users Library folder by default. Once I found the file, I shut down the VM and did this on the host:

qemu-img resize disk-0.qcow2 50G
Then I started the VM, installed gparted and expanded the partition. df still reported the disk to be 90% full though. Eventually I figured that I also needed to expand the logical volume. The command to do this was:

sudo lvextend -l +100%FREE /dev/mapper/<volume name>
But still df reported the volume to be full. Seems the ext4 filesystem also needs to be expanded. This did the job:

sudo resize2fs /dev/mapper/<volume name>
Finally df reports lots of free space! Sweet!

New-ADUser -Name 'AmieAcevedo' -Type iNetOrgPerson -OtherAttributes @{
'givenName'='Amie'
'sn'='Acevedo'
'title'='director'
 'mail'='AAcevedo01@mailinator.com'
 }

New-ADUser -Name 'SionDuke' -Type iNetOrgPerson -OtherAttributes @{
     'title'='director'
     'mail'='Sion Duke01@mailinator.com'
 }
New-ADUser -Name 'MasonBass
' -Type iNetOrgPerson -OtherAttributes @{
     'title'='manager'
     'mail'='AMasonBass@mailinator.com'
 }
New-ADUser -Name 'Dana Carney' -Type iNetOrgPerson -OtherAttributes @{
     'title'='IT'
     'mail'='ADana Carney@mailinator.com'
 }
New-ADUser -Name 'SusieStuart' -Type iNetOrgPerson -OtherAttributes @{
     'title'='HR'
     'mail'='SusieStuart@mailinator.com'
 }


New-ADUser -Name 'Amie Acevedo' -Type iNetOrgPerson -OtherAttributes @{
     'title'='director'
     'mail'='AAcevedo01@mailinator.com'
 }
New-ADUser -Name 'Amie Acevedo' -Type iNetOrgPerson -OtherAttributes @{
     'title'='director'
     'mail'='AAcevedo01@mailinator.com'
 }
New-ADUser -Name 'Amie Acevedo' -Type iNetOrgPerson -OtherAttributes @{
     'title'='director'
     'mail'='AAcevedo01@mailinator.com'
 }

#ext13=#this.get("ad.SAForm.extensionAttribute13")!=null?#this.get("ad.SAForm.extensionAttribute13").toString():"",

https://docs.pingidentity.com/r/en-us/pingone/pingone_protect_best_practices
User risk behavior not for ciam/ travel 1000km per hour and location is 50km


https://newpademo.ping-eng.com:3000/anything
Scheduled Out of Office Days: None
1) Add to OIDC PolicyApplication > OIDC Policy > Edit Contract > Add Attributeexample: linkedinurl
2) Link new value to a scopeClick Attribute Scope and add the value
3) If value is coming from LDAP add the lookup and map it
4) open ID mapping and attribute and the header mapping


```

```
jwtgen -a "HS256" -s "YOUR_CLIENT_SECRET" -e 3600 --claims '{"iss":"YOUR_CLIENT_ID","sub":"YOUR_USER_ID_OR_USERNAME","iat":1300819380,"exp":1300819391,"aud":"https://auth.pingone.com/YOUR_ENVIRONMENT_ID/as"}'jwtgen -a "HS256" -s "UI5uc~nF2Kubq-Iq~CFoU1b0lDKv40XQM_V~bynkP6~eU6dKRNmc7W~XXmZwVhEv" -e 3600 --claims '{"iss":"4e6c8335-09dd-46ae-8dd2-2fe92c5dda2a","sub":"peterparker","iat":1300819380,"exp":1300819391,"aud":"https://auth.pingone.com/b30d511e-2770-4108-90b8-3d38aa5eb986/as"}'mitchelllewars-r:Downloads mitchelllewars$ jwtgen -a "HS256" -s "UI5uc~nF2Kubq-Iq~CFoU1b0lDKv40XQM_V~bynkP6~eU6dKRNmc7W~XXmZwVhEv" -e 3600 --claims '{
> "iss":"4e6c8335-09dd-46ae-8dd2-2fe92c5dda2a","sub":"peterparker","aud":"https://auth.pingone.com/b30d511e-2770-4108-90b8-3d38aa5eb986/as"}'
eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjEzMDA4MTkzODAsImV4cCI6MTMwMDgxOTM5MSwiaXNzIjoiNGU2YzgzMzUtMDlkZC00NmFlLThkZDItMmZlOTJjNWRkYTJhIiwic3ViIjoicGV0ZXJwYXJrZXIiLCJhdWQiOiJodHRwczovL2F1dGgucGluZ29uZS5jb20vYjMwZDUxMWUtMjc3MC00MTA4LTkwYjgtM2QzOGFhNWViOTg2L2FzIn0.wsHOB1gaGN6v9TAruVpgQgytyVFNnhGbrVTokJQZiF0
jwtgen -a "HS256" -s "UI5uc~nF2Kubq-Iq~CFoU1b0lDKv40XQM_V~bynkP6~eU6dKRNmc7W~XXmZwVhEv" -e 3600 --claims '{"iss":"4e6c8335-09dd-46ae-8dd2-2fe92c5dda2a","sub":"peterparker","aud":"https://auth.pingone.com/b30d511e-2770-4108-90b8-3d38aa5eb986/as"}'
```

```
The Access Grants table is only used to store persistent access grants.

One database entry is created per user, per OAuth client, per authorization.

To calculate your requirements, start by multiplying the expected number of users by the number of OAuth clients and the number of bytes for an access grant. 

Size Estimates of Grant Types:

Access Grant: 2,039 bytes

OAuth Client: 3,542 bytes

Extended OAuth Client: 1,413 bytes
```



