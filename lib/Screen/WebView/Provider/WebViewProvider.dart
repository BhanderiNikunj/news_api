import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewProvider extends ChangeNotifier {
  WebViewController? webViewController;

  void loardUrl(String Link) {
    webViewController = WebViewController();
    webViewController!.loadRequest(
      Uri.parse(Link),
    );
  }
}
