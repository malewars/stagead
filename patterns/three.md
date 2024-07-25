```

client json file:
{"web":{"client_id":"582774151018-i44a2nah65s2kieag12tacjcn1ei2cni.apps.googleusercontent.com","project_id":"davinci-project-386411","auth_uri":"https://accounts.google.com/o/oauth2/auth","token_uri":"https://oauth2.googleapis.com/token","auth_provider_x509_cert_url":"https://www.googleapis.com/oauth2/v1/certs","client_secret":""}}
```

```
Debugging Passwordless Article: https://docs.pingidentity.com/r/en-us/pingid/pingid_troubleshooting_passwordless_windows_login

wss://demo.piesocket.com/v3/channel_123?api_key=VCXCEuvhGcBDP7XhiJJUDvR1e1D3eiVjgZ9VRiaV&notify_self



let webSocket = new WebSocket('wss://wss://demo.piesocket.com/v3/channel_123?api_key=VCXCEuvhGcBDP7XhiJJUDvR1e1D3eiVjgZ9VRiaV&notify_self');webSocket.onmessage = function(e) { console.log(e)}webSocket.send("test")
```

```
Your query was:
#groups = #this.get("ds.PingDirectory.isMemberOf")!=null?#this.get("ds.PingDirectory.isMemberOf").getValues():{},
#groups.{
    #group = #this,
    #group = new javax.naming.ldap.LdapName(#role),
    #cn = #group.getRdn(#group.size() - 1).getValue().toString(),
    #groupCnOnly.add(#cn)
},
#this.get("ds.PingDirectory.isMemberOf")!=null? new org.sourceid.saml20.adapter.attribute.AttributeValue(#groupCnOnly):null

The one that worked for me (this shows all groups and groups of groups...):
#groupCnOnly = new java.util.ArrayList(),

#groups = #this.get("isMemberOf")!=null?#this.get("isMemberOf").getValues():{},

#groups.{

   #group = #this,

   #group = new javax.naming.ldap.LdapName(#group),

   #cn = #group.getRdn(#group.size() - 1).getValue().toString(),

   #groupCnOnly.add(#cn)

},

#groupCNs = #groupCnOnly.toString().replaceAll("\\[|\\]",""),

new org.sourceid.saml20.adapter.attribute.AttributeValue(#groupCNs)
```

```
for (let i = 0; i < keys.length; i++){
console.log(userInfo[keys[i]]);
matched.push(userInfo[keys[i]]);
}
```

```
PKCE, after enabling PKCE in the OAuth Client, you may wish to test it.* Info: RFC 7636: Proof Key for Code Exchange
Example Test Case, note that part of this requires a valid Auth Method, Scopes, etc.
Sample for creating the Verifier: https://www.loginradius.com/blog/async/pkce/ Simple Nodejs example Code: var crypto = require("crypto")
function base64URLEncode(str) {
    return str.toString('base64')        .replace(/\+/g, '-')        .replace(/\//g, '_')        .replace(/=/g, '');}var verifier = base64URLEncode(crypto.randomBytes(32));console.log("code_verifier: ", verifier)if(verifier){
    var challenge = base64URLEncode(sha256(verifier));    console.log("code_challenge: ",challenge)} 
function sha256(buffer) {    return crypto.createHash('sha256').update(buffer).digest();} Execution: - Create the Random string and submit it.code_verifier:  3cD8LsbzfurPDJkgCZEJWPW4WRfZro0xL8eL6WnQ0Qkcode_challenge:  mhjAbSndtsCyYDCKjI1CUuYSB4w_DphBPAoapYLrdZ8 Considerations:Technically, PF will support: plain      code_challenge = code_verifier S256      code_challenge = BASE64URL-ENCODE(SHA256(ASCII(code_verifier))) S256 is considered more standard and secure. Submitting PKCE to PingFederate Step 1:Enable PKCE on the Client (you can choose to remove the Client Secret or use both) in PingFederate OAuth Client.
Complete the same steps we have before but add the additional fields to the request. In the Request for the Auth Code, include the challenge and challenge method:&code_challenge={code challenge}&code_challenge_method=SHA256 In the Code Exchange, include the code_verifier:        code_verifier: {code verifier // generated in the first step}----------  All Steps are demoed below.Bear in mind, PF uses flows to manage the Authentication process, in the example below we are using an Authentication  Step 1: Initiate a Request against the Oauth Client to get a flowID: wget --no-check-certificate --quiet \  --method GET \  --timeout=0 \  --header 'Cookie: PF=QOsEjF2qE7Wufhe66COBde' \   'https://sso.ping-eng.com:9031/as/authorization.oauth2?client_id=demodishauthclient&response_type=code&redirect_uri=https://sso.ping-eng.com:9031/OAuthPlayground/authorization_code/oidc/callback&response_mode=form_post&scope=openid&code_challenge=mhjAbSndtsCyYDCKjI1CUuYSB4w_DphBPAoapYLrdZ8&code_challenge_method=S256' RESPONSE: flowId= o6M1w   Step 2: Initiate an auth session with the flowID: wget --no-check-certificate --quiet \  --method GET \  --timeout=0 \  --header 'X-XSRF-Header: PingFederate' \  --header 'Cookie: PF=QOsEjF2qE7Wufhe66COBdeArP2eFBVD1AT7IOEQadLLo' \   'https://sso.ping-eng.com:9031/pf-ws/authn/flows/o6M1w' RESPONSE:    "id": "o6M1w",    "pluginTypeId": "7RmQNDWaOnBoudTufx2sEw",    "status": "USERNAME_PASSWORD_REQUIRED", Step 3: Post the User Credentials to the adapter including the flowID: wget --no-check-certificate --quiet \  --method POST \  --timeout=0 \  --header 'Content-Type: application/vnd.pingidentity.checkUsernamePassword+json' \  --header 'X-XSRF-Header: PingFederate' \  --header 'Cookie: PF=QOsEjF2qE7Wufhe66COBdeoK0aOtjqBFohSYgimhypH7' \  --body-data '{  "username": "user1",  "password": "test"}' \   'https://sso.ping-eng.com:9031/pf-ws/authn/flows/o6M1w' RESPONSE:    "id": "o6M1w",    "pluginTypeId": "7RmQNDWaOnBoudTufx2sEw",    "status": "RESUME",    "resumeUrl": "https://sso.ping-eng.com:9031/as/o6M1w/resume/as/authorization.ping", Step 4: Send a Get to the Resume URL to get the Auth Code: wget --no-check-certificate --quiet \  --method GET \  --timeout=0 \  --header 'Cookie: PF=YWbymMl3vZx6HZcuzre_I4NWPeGB-9byb3qY1QFL' \   'https://sso.ping-eng.com:9031/as/o6M1w/resume/as/authorization.ping' RESPONSE:<input type="hidden" name="code" value="0mC8_DVzBnWep29jC5LmluiyS2fPFZqfsFAjT6y4"/> Step 5: Exchange the Code for the Access Token / Id Token / Refresh Token With Code Verifier: wget --no-check-certificate --quiet \  --method POST \  --timeout=0 \  --header 'Content-Type: application/x-www-form-urlencoded' \  --header 'Cookie: PF=QOsEjF2qE7Wufhe66COBdeWG3zW6HN3VUae9A7SvV2X3' \  --body-data 'grant_type=authorization_code&code=YWbymMl3vZx6HZcuzre_I4NWPeGB-9byb3qY1QFL&redirect_uri=https%3A%2F%2Fsso.ping-eng.com%3A9031%2FOAuthPlayground%2Fauthorization_code%2Foidc%2Fcallback&code_verifier=3cD8LsbzfurPDJkgCZEJWPW4WRfZro0xL8eL6WnQ0Qk&client_id=demodishauthclient' \   'https://sso.ping-eng.com:9031/as/token.oauth2' RESPONSE:{    "access_token": "s8zu2AWlaeTjhnUI12cUs2O44C55",    "refresh_token": "w013qGNRJjdQUobSW0hGBeKbw9Aexfu4ERjhK9oMmA",    "id_token": "eyJhbGciOiJSUzI1NiIsImtpZCI6ImhBVTlpamRCZGZKOTJ1Rm5DbWljT1ZHYmUtTSJ9.eyJzdWIiOiJtaXRjaCIsImF1ZCI6ImRlbW9kaXNoYXV0aGNsaWVudCIsImp0aSI6IndqakpQZXVhSG95elJQVHczTVNEeDEiLCJpc3MiOiJodHRwczovL3Nzby5waW5nLWVuZy5jb206OTAzMSIsImlhdCI6MTYyNDM3Njg4MiwiZXhwIjoxNjI0Mzc3MTgyLCJhdXRoX3RpbWUiOjE2MjQzNzY4NzIsIm1haWwiOiJtaXRjaCIsImdpdmVuTmFtZSI6Im1pdGNoIiwic24iOiJtaXRjaCIsInBpLnNyaSI6IlJPcEM0Vk82RlNRcnltcFhKbFJsbjdTZHc2OC4uMGdZRCJ9.c8eMLOK4ZYXVRr3RNdRAJBnAQa5eycm_ddGxu_PnDQKe2V7APgrPQGbp9SW1VVCr37E2kLkQqOqYwVH1kwdjNZ3oep5_qZO0Am5eSRTg9_Ki7oMTdNoMZVhXRJBQ9A-01O-H5ZdEMAftWBHcz-9WzEkolXFYKIrZKOTMLEeC5WwRRYL6CoH1CSOtp7A98pH7lS0lhaeUMUcqDQD58GywyUicVsXoHRKSQ2iACrXDqOLhBOjaC07g8WA3v3wTHPm3lNzFQBsW9oAd4g6XYzeRwCWd6VvVuYIECInVOPzoFuUjECf_hYynP0GncoE0yYoWnwUyycJiZoFSfbTM-qir5w",    "token_type": "Bearer",    "expires_in": 7199}  Some other good reference:

https://docs.pingidentity.com/bundle/developer/page/rqb1602278477831.html
https://github.com/aaronpk/pkce-vanilla-js
```

```

brew install libzip-dev
brew install boost
brew install cmake

export LDFLAGS="-L/opt/homebrew/lib"
export CPPFLAGS="-I/opt/homebrew/include"
export LIBRARY_PATH="$LIBRARY_PATH:$(brew --prefix)/lib"

make

```
```bash
sudo apt-get install libcurl4-openssl-dev libzip-dev
git clone https://github.com/paolo-projects/auto-unlocker
cd auto-unlocker
make
chmod +x ./auto-unlocker
sudo ./auto-unlocker


```
