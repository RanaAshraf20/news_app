import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/article_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatefulWidget {
  const WebView({super.key, required this.articleModel});
  final ArticleModel articleModel;

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  late final WebViewController controller; // استخدم late لتهيئة المتغير لاحقًا

  @override
  void initState() {
    super.initState();
    // تهيئة WebViewController هنا
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.articleModel.url)); // استخدم widget هنا
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
          WebViewWidget(controller: controller), // تأكد من تمرير الـ controller
    );
  }
}
