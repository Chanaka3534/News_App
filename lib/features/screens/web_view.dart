import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart'; // Android-specific
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart'; // iOS-specific

// ignore: must_be_immutable
class WebViewPage extends StatefulWidget {
  String url;
  WebViewPage({super.key, required this.url});

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    // Platform-specific WebView settings for Android and iOS
    late final PlatformWebViewControllerCreationParams params;

    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = const PlatformWebViewControllerCreationParams();
    } else if (WebViewPlatform.instance is AndroidWebViewPlatform) {
      params = const PlatformWebViewControllerCreationParams();
    }

    _controller = WebViewController.fromPlatformCreationParams(params)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Flash',
                style: GoogleFonts.protestRevolution(
                    textStyle: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.w500))),
            Text('News',
                style: GoogleFonts.protestRevolution(
                    textStyle: const TextStyle(
                        color: Colors.blue,
                        fontSize: 28,
                        fontWeight: FontWeight.w500))),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              _controller.reload();
            },
          ),
        ],
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
