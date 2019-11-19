import 'package:flutter/material.dart';

class MaterialDemoDocumentationButton extends StatelessWidget {
  MaterialDemoDocumentationButton(String routeName, { Key key })
    : documentationUrl = kDemoDocumentationUrl[routeName],
      assert(
        kDemoDocumentationUrl[routeName] != null,
        'A documentation URL was not specified for demo route $routeName in kAllGalleryDemos',
      ),
      super(key: key);

  final String documentationUrl;

  static get kDemoDocumentationUrl => null;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.library_books),
      tooltip: 'API documentation',
      onPressed: () => launch(documentationUrl, forceWebView: true),
          );
        }
      
        launch(String documentationUrl, {bool forceWebView}) {}
}