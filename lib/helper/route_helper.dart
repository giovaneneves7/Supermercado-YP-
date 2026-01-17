import 'package:app_supermercado_ype/features/webview/screens/webview_screen.dart';
import 'package:get/get.dart';

class RouteHelper{

  static const String webView = '/webView';

  static String getWebViewScreen() => webView;

  /// List with all routes as GetPages
  static List<GetPage> routes = [

    GetPage(name: webView, page: () => WebViewScreen()),

  ];


}