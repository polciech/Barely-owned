import 'package:flutter/material.dart';
import 'login_page.dart';
import 'search_page.dart';
import 'add_clothing_page.dart';
import 'cloth_page.dart';
import 'home_page.dart';
import 'chat.dart';
import 'conversations.dart';

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
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Container(
            decoration: BoxDecoration(
              color: Colors.white, // Set the background color here
              shape: BoxShape.circle, // Optional: You can set the shape
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0), // Optional: Adjust padding
              child: Icon(Icons.home,
                  color: Colors.grey), // Set the icon color here
            ),
          ),
          label: 'Strona Główna',
        ),
        BottomNavigationBarItem(
          icon: Container(
            decoration: BoxDecoration(
              color: Colors.white, // Set the background color here
              shape: BoxShape.circle, // Optional: You can set the shape
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0), // Optional: Adjust padding
              child: Icon(Icons.favorite,
                  color: Colors.grey), // Set the icon color here
            ),
          ),
          label: 'Ulubione',
        ),
        BottomNavigationBarItem(
          icon: Container(
            decoration: BoxDecoration(
              color: Colors.white, // Set the background color here
              shape: BoxShape.circle, // Optional: You can set the shape
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0), // Optional: Adjust padding
              child: Icon(Icons.add,
                  color: Colors.grey), // Set the icon color here
            ),
          ),
          label: 'Dodaj',
        ),
        BottomNavigationBarItem(
          icon: Container(
            decoration: BoxDecoration(
              color: Colors.white, // Set the background color here
              shape: BoxShape.circle, // Optional: You can set the shape
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0), // Optional: Adjust padding
              child: Icon(Icons.mail,
                  color: Colors.grey), // Set the icon color here
            ),
          ),
          label: 'Wiadomości',
        ),
        BottomNavigationBarItem(
          icon: Container(
            decoration: BoxDecoration(
              color: Colors.white, // Set the background color here
              shape: BoxShape.circle, // Optional: You can set the shape
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0), // Optional: Adjust padding
              child: Icon(Icons.person,
                  color: Colors.grey), // Set the icon color here
            ),
          ),
          label: 'Profil',
        ),
      ],
      selectedItemColor: Colors.grey,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      onTap: (index) {
        // Dodaj kod obsługujący przekierowanie na stronę logowania
        if (index == 4) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        }
        if (index == 3) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => ConversationsPage()),
          );
        }
        if (index == 2) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => AddClothingPage()),
          );
        }
        if (index == 1) {}
        if (index == 0) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        }
      },
    );
  }
}
