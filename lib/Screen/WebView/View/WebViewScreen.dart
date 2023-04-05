import 'package:flutter/material.dart';
import 'package:news_api/Screen/WebView/Provider/WebViewProvider.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({Key? key}) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {

  WebViewProvider? webViewProviderFalse;

  @override
  Widget build(BuildContext context) {

    webViewProviderFalse = Provider.of<WebViewProvider>(context,listen: false);

    return SafeArea(
      child: Scaffold(
        body: WebViewWidget(
          controller: webViewProviderFalse!.webViewController!,
        ),
      ),
    );
  }
}
