import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EventUnpamScreen extends StatefulWidget {
  final bool isDesktopView;

  const EventUnpamScreen({super.key, required this.isDesktopView});

  @override
  EventUnpamScreenState createState() => EventUnpamScreenState();
}

class EventUnpamScreenState extends State<EventUnpamScreen> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WebView(
            initialUrl: 'https://event.unpam.ac.id/login',
            javascriptMode: JavascriptMode.unrestricted,
            userAgent: widget.isDesktopView
                ? 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:128.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0 Gecko/20100101 Firefox/128.0'
                : 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko) Version/17.0 Mobile/15E148 Safari/537.36 Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0 Gecko/20100101 Firefox/128.0',
            onPageStarted: (String url) {
              setState(() {
                _isLoading = true;
              });
            },
            onPageFinished: (String url) {
              setState(() {
                _isLoading = false;
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
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
