// home_page.dart
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wyszukaj'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Wyniki wyszukiwania',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                // Przykładowe zdjęcia
                ImageCaptionWidget(
                  imageUrl: 'https://via.placeholder.com/150',
                  caption: 'Koszulka - 38,99',
                ),
                ImageCaptionWidget(
                  imageUrl: 'https://via.placeholder.com/150',
                  caption: 'Spodnie - 40,54',
                ),
                ImageCaptionWidget(
                  imageUrl: 'https://via.placeholder.com/150',
                  caption: 'Koszulka - 23,89',
                ),
                ImageCaptionWidget(
                  imageUrl: 'https://via.placeholder.com/150',
                  caption: 'Bluza - 120,99',
                ),
                ImageCaptionWidget(
                  imageUrl: 'https://via.placeholder.com/150',
                  caption: 'Spodnie - 10,21',
                ),
                ImageCaptionWidget(
                  imageUrl: 'https://via.placeholder.com/150',
                  caption: 'Majtki - 209,88',
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
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

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Strona Główna',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Ulubione',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: 'Dodaj',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.mail),
          label: 'Wiadomości',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profil',
        ),
      ],
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
    );
  }
}
