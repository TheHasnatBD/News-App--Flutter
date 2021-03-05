import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWebView extends StatefulWidget {

  final String postTitle;
  final String postUrl;

  const ArticleWebView({this.postUrl, this.postTitle});

  @override
  _ArticleState createState() => _ArticleState();
}

class _ArticleState extends State<ArticleWebView> {

  final  Completer<WebViewController> _completer = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Text(
              " ",
              //"News Detail",
              //widget.postTitle.toString(),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              //softWrap: false,
            ),
          ],
        ),
        actions: [
          Opacity(
            opacity: 0,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.close)),
          )
        ],
        //centerTitle: true,
        elevation: 0.0,
        //automaticallyImplyLeading: false,
      ),
      body : Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl: widget.postUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: ((WebViewController webViewController){
            _completer.complete(webViewController);
          }),
        ),
      ),
    );
  }


}
