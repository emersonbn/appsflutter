import 'dart:io';

import 'package:meta/meta.dart';
import 'package:oauth1/oauth1.dart' as oauth1;

class FluigClient {

  final username;
  final password;

  static const String consumerKey = '';
  static const String consumerSecret = '';
  static const String token = '';
  static const String secret = '';
  static const String urlBase = 'http://testefluig.lowcucar.com.br:8098/portal/api/rest/';


  FluigClient({@required this.username,
    @required this.password});

  var platform = new oauth1.Platform(
      '${urlBase}oauth/request_token', // temporary credentials request
      '${urlBase}oauth/authorize', // resource owner authorization
      '${urlBase}oauth/access_token', // token credentials request
      oauth1.SignatureMethods.hmacSha1            // signature method
  );

  // define client credentials (consumer keys)
  final String apiKey = "b1203a09-eb05-4d23-be48-60ca12a33a9c";
  final String apiSecret = "26074c3e-283e-43e0-8c85-4b93d9f0a184f6bd6ef3-afcd-4232-9a62-f965b0611f21";

   authorize(){
    var clientCredentials = new oauth1.ClientCredentials(apiKey, apiSecret);

    // create Authorization object with client credentials and platform definition
    var auth = new oauth1.Authorization(clientCredentials, platform);

    // request temporary credentials (request tokens)
    auth.requestTemporaryCredentials("${urlBase}oauth/request_token").then((res) {
      // redirect to authorization page
      //print("RES:${res}");
      print("Open with your browser: ${auth.getResourceOwnerAuthorizationURI(res.credentials.token)}");
     
     //print("Open with your browser: ${auth.getResourceOwnerAuthorizationURI(res)}");


      // get verifier (PIN)
      stdout.write("PIN: ");
      String verifier = stdin.readLineSync();


      // request token credentials (access tokens)
      return auth.requestTokenCredentials(res.credentials, verifier);
    }).then((res) {
      // yeah, you got token credentials
      // create Client object
      var client = new oauth1.Client(platform.signatureMethod, clientCredentials, res.credentials);

      // now you can access to protected resources via client
      var response = client.get('http://testefluig.lowcucar.com.br:8098/portal/api/public/social/user?limit=1000&offset=0').then((res) {
        print(res.body);
        
      });
      print(response);
      // NOTE: you can get optional values from AuthorizationResponse object
//      print("Your screen name is " + res.optionalParameters['screen_name']);
    });
  }
}