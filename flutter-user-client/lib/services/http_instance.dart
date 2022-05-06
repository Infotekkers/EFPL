import 'package:efpl/injectable.dart';
import 'package:efpl/services/http_interceptor.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:injectable/injectable.dart';

class HTTPInstance {
  Client client = InterceptedClient.build(interceptors: [
    TokenInjectionInterceptor(),
  ]);
}
