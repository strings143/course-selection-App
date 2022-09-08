import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BoardPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          // height: 600,
          // the most important part of this example
          child: WebView(
            initialUrl: 'https://sis.dyu.edu.tw/RWD/index.html',
            // Enable Javascript on WebView
            javascriptMode: JavascriptMode.unrestricted,
          )
      ),
    );
  }
}