import 'package:http_interceptor/http_interceptor.dart';

// Injects token at send
class TokenInjectionInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    try {
      data.params["token"] = "APPEND_TOKEN_HERE";
    } catch (e) {
      print(e);
    }
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async =>
      data;
}
