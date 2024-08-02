import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyUnpam2Screen extends StatelessWidget {
  final bool isDesktopView;

  const MyUnpam2Screen({super.key, required this.isDesktopView});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: 'https://my.unpam.id/',
        javascriptMode: JavascriptMode.unrestricted,
        userAgent: isDesktopView
            ? 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
            : null,
        onWebResourceError: (WebResourceError error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Web resource error: ${error.description}'),
              backgroundColor: Colors.red,
            ),
          );
        },
        onPageStarted: (String url) {
          print('Page started loading: $url');
        },
        onPageFinished: (String url) {
          print('Page finished loading: $url');
        },
        navigationDelegate: (NavigationRequest request) {
          if (request.url.startsWith('https://')) {
            print('Navigating to ${request.url}');
            return NavigationDecision.navigate;
          } else {
            print('Blocking navigation to ${request.url}');
            return NavigationDecision.prevent;
          }
        },
      ),
    );
  }
}
