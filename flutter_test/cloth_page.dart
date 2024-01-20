import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ClothPage(),
    );
  }
}

class ClothPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cloth Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Use the ImageCaptionWidget with required parameters
            ImageCaptionWidget(
              imageUrl: 'https://example.com/image.jpg',
              caption: 'Sample Caption',
            ),
          ],
        ),
      ),
    );
  }
}

class ImageCaptionWidget extends StatelessWidget {
  final String imageUrl;
  final String caption;

  const ImageCaptionWidget({
    required this.imageUrl,
    required this.caption,
  });

  void navigateToProductPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductPage(imageUrl: imageUrl, caption: caption),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigateToProductPage(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(imageUrl),
          SizedBox(height: 8.0),
          Text(
            caption,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}

class ProductPage extends StatelessWidget {
  final String imageUrl;
  final String caption;

  ProductPage({
    required this.imageUrl,
    required this.caption,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Page'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Center(
            child: Container(
              height: 200.0,
              width: 200.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            caption,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          // ... other details as needed
        ],
      ),
    );
  }
}
