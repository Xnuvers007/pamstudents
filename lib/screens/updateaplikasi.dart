import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class UpdateAplikasi extends StatelessWidget {
  const UpdateAplikasi({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WebView(
        initialUrl: 'https://github.com/Xnuvers007/pamstudents',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
