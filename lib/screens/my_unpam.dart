// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// class MyUnpamScreen extends StatelessWidget {
//   final bool isDesktopView;
//
//   const MyUnpamScreen({super.key, required this.isDesktopView});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: WebView(
//         initialUrl: 'https://my.unpam.ac.id/',
//         javascriptMode: JavascriptMode.unrestricted,
//         userAgent: isDesktopView
//             ? 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
//             : null,
//         onWebResourceError: (WebResourceError error) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text('Web resource error: ${error.description}'),
//               backgroundColor: Colors.red,
//             ),
//           );
//         },
//         onPageStarted: (String url) {
//           print('Page started loading: $url');
//         },
//         onPageFinished: (String url) {
//           print('Page finished loading: $url');
//         },
//         navigationDelegate: (NavigationRequest request) {
//           if (request.url.startsWith('https://')) {
//             print('Navigating to ${request.url}');
//             return NavigationDecision.navigate;
//           } else {
//             print('Blocking navigation to ${request.url}');
//             return NavigationDecision.prevent;
//           }
//         },
//       ),
//     );
//   }
// }
//
//
//
// // import 'package:flutter/material.dart';
// // import 'package:webview_flutter/webview_flutter.dart';
// //
// // class MyUnpamScreen extends StatelessWidget {
// //   const MyUnpamScreen({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return const WebView(
// //       initialUrl: 'https://my.unpam.ac.id/',
// //       javascriptMode: JavascriptMode.unrestricted,
// //     );
// //   }
// // }
// //
// // // import 'package:flutter/material.dart';
// // // import 'package:webview_flutter/webview_flutter.dart';
// // //
// // // class MyUnpamScreen extends StatelessWidget {
// // //   const MyUnpamScreen({super.key});
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: const Text('My Unpam'),
// // //         backgroundColor: Colors.black, // Warna background AppBar hitam
// // //       ),
// // //       body: WebView(
// // //         initialUrl: 'https://my.unpam.ac.id/',
// // //         javascriptMode: JavascriptMode.unrestricted,
// // //         onWebResourceError: (WebResourceError error) {
// // //           // Tampilkan SnackBar untuk menampilkan error
// // //           ScaffoldMessenger.of(context).showSnackBar(
// // //             SnackBar(
// // //               content: Text('Web resource error: ${error.description}'),
// // //               backgroundColor: Colors.red,
// // //             ),
// // //           );
// // //         },
// // //         onPageStarted: (String url) {
// // //           print('Page started loading: $url');
// // //         },
// // //         onPageFinished: (String url) {
// // //           print('Page finished loading: $url');
// // //         },
// // //         navigationDelegate: (NavigationRequest request) {
// // //           if (request.url.startsWith('https://')) {
// // //             print('Navigating to ${request.url}');
// // //             return NavigationDecision.navigate;
// // //           } else {
// // //             print('Blocking navigation to ${request.url}');
// // //             return NavigationDecision.prevent;
// // //           }
// // //         },
// // //         // Menambahkan User-Agent untuk meniru tampilan desktop
// // //         userAgent: 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36',
// // //       ),
// // //     );
// // //   }
// // // }

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyUnpamScreen extends StatefulWidget {
  final bool isDesktopView;

  const MyUnpamScreen({super.key, required this.isDesktopView});

  @override
  State<MyUnpamScreen> createState() => MyUnpamScreenState();
}

class MyUnpamScreenState extends State<MyUnpamScreen> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WebView(
            initialUrl: 'https://my.unpam.ac.id/',
            javascriptMode: JavascriptMode.unrestricted,
            userAgent: widget.isDesktopView
                ? 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:128.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0 Gecko/20100101 Firefox/128.0'
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
