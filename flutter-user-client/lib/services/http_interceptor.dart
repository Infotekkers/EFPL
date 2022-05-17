import 'package:http_interceptor/http_interceptor.dart';

// Injects token at send
class TokenInjectionInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    try {
      // TODO:ADD Token
      data.params["token"] =
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoiNjI3YTc3OThiZWQ5ZTU2NzI2OWJiOGE5IiwiaWF0IjoxNjUyNzI2OTcwLCJleHAiOjE2ODQyNjI5NzB9.OkXMP2r7AxyKNkh3et5TS3EWSxpSMwrfdrPlaRj1-Uw";
    } catch (e) {
      print(e);
    }
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async =>
      data;
}
