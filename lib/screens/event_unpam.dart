import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EventUnpamScreen extends StatelessWidget {
  const EventUnpamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: 'https://event.unpam.ac.id/login',
        javascriptMode: JavascriptMode.unrestricted,
        navigationDelegate: (NavigationRequest request) {
          if (request.url.startsWith('https://')) {
            return NavigationDecision.navigate;
          } else {
            return NavigationDecision.prevent;
          }
        },
      ),
    );
  }
}
