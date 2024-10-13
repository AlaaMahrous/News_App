import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewExample extends StatefulWidget {
  const WebViewExample({super.key, required this.webUrl});
  final String webUrl;

  @override
  State<WebViewExample> createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  late final WebViewController _controller;
  bool isLoading = true; 

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              isLoading = true; // عند بدء التحميل
            });
          },
          onPageFinished: (String url) {
            setState(() {
              isLoading = false; // عند انتهاء التحميل
            });
          },
          onWebResourceError: (WebResourceError error) {
            setState(() {
              isLoading = false; // إيقاف التحميل عند حدوث خطأ
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.webUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('News', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            Text('Cloud', style: TextStyle(color: Color.fromARGB(255, 255, 192, 98), fontWeight: FontWeight.bold)),
          ]
        ),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (isLoading) 
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
