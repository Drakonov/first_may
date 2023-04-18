import 'dart:io';

class ProxyHttpOverride extends HttpOverrides {
  ProxyHttpOverride(this.ip);

  final String ip;

  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..findProxy = (uri) {
        return "PROXY $ip;";
      }
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
