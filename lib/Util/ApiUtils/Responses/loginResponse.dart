import 'package:grand_bazar/Util/ApiUtils/Responses/postRequestResponse.dart';

import 'package:grand_bazar/Util/ApiUtils/sessionManager/userSession.dart';
import 'package:grand_bazar/Util/constants/apiUserMessageConstants.dart';

class LoginResponse {
  PostReqResponse postReqResponse;
  late UserSession userSession;

  LoginResponse({required this.postReqResponse, required this.userSession});
  LoginResponse.m(this.postReqResponse);

  static Future<LoginResponse> getResponse(
      ResponseBuilder responseBuilder) async {
    LoginResponse response;
    PostReqResponse postReqResponse;
    print('Received status code ' + responseBuilder.statusCode.toString());

    switch (responseBuilder.statusCode) {
      case 202:
        postReqResponse = PostReqResponse(
            status: true, message: userLoginSucussfull, code: 00);
        print('sucuss');
        response = LoginResponse(
            postReqResponse: postReqResponse,
            userSession: responseBuilder.userSession);
        return response;

      default:
        postReqResponse = PostReqResponse(
            status: false, message: userLoginUnSucussfull, code: 01);
        print('failed');
        response = LoginResponse.m(postReqResponse);
        return response;
    }
  }
}

class ResponseBuilder {
  int statusCode;
  late UserSession userSession;

  ResponseBuilder({required this.statusCode, required this.userSession});
  ResponseBuilder.m(this.statusCode);
}
