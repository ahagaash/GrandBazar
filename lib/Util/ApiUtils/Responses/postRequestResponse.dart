import 'package:grand_bazar/Util/constants/apiUserMessageConstants.dart';

class PostReqResponse {
  late bool status;
  late String message;
  late int code;

  //constrctors

  PostReqResponse(
      {required this.status, required this.message, required this.code});

  static Future<PostReqResponse> getResponse(statusCode) async {
    PostReqResponse respose;
    print('Received status code ' + statusCode.toString());

    switch (statusCode) {
      case 201:
        respose = PostReqResponse(
            status: true, message: userRegisterSucuss, code: 00);
        print('sucuss');
        return respose;

      default:
        respose = PostReqResponse(
            status: false, message: userRegisterUnSucussfull, code: 01);
        print('failed');
        return respose;
    }
  }
}
