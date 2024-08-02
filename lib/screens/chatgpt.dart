// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// class ChatGPTScreen extends StatelessWidget {
//   const ChatGPTScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: WebView(
//         initialUrl: 'https://chatgpt.com',
//         javascriptMode: JavascriptMode.unrestricted,
//         navigationDelegate: (NavigationRequest request) {
//           if (request.url.startsWith('https://chatgpt.com')) {
//             return NavigationDecision.navigate;
//           } else {
//             return NavigationDecision.prevent;
//           }
//         },
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ChatGPTScreen extends StatelessWidget {
  const ChatGPTScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WebView(
        initialUrl: 'https://chatgpt.com/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
