import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebsiteAuthorScreen extends StatefulWidget {
  final bool isDesktopView;

  const WebsiteAuthorScreen({super.key, required this.isDesktopView});

  @override
  State<WebsiteAuthorScreen> createState() => _WebsiteAuthorScreenState();
}

class _WebsiteAuthorScreenState extends State<WebsiteAuthorScreen> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WebView(
            initialUrl: 'https://mykingbee.blogspot.com/',
            javascriptMode: JavascriptMode.unrestricted,
            userAgent: widget.isDesktopView
                ? 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
                : 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko) Version/17.0 Mobile/15E148 Safari/537.36 Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0 Gecko/20100101 Firefox/128.0',
            onPageStarted: (String url) {
              setState(() {
                isLoading = true;
              });
            },
            onPageFinished: (String url) {
              setState(() {
                isLoading = false;
              });
            },
            onWebResourceError: (WebResourceError error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Web resource error: ${error.description}'),
                  backgroundColor: Colors.red,
                ),
              );
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
          if (isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
