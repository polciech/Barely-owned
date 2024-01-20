// home_page.dart
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'search_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wyszukaj'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => SearchPage()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.0),
                // Przykładowe zdjęcia
                ImageCaptionWidget(
                  imageUrl:
                      'https://patrioty.pl/17651-medium_default/koszulka-orzel-styl.jpg',
                  caption: 'Koszulka - 38,99',
                ),
                ImageCaptionWidget(
                  imageUrl:
                      'https://th.bing.com/th/id/OIP.VqN6aKK2mipVDRAAyHlHcQAAAA?w=136&h=147&c=7&r=0&o=5&dpr=1.3&pid=1.7',
                  caption: 'Spodnie - 40,54',
                ),
                ImageCaptionWidget(
                  imageUrl:
                      'https://th.bing.com/th/id/OIP.c5K2w9TmEwTHSPyb6d_R5AHaIZ?w=89&h=90&c=1&rs=1&qlt=90&r=0&dpr=1.3&pid=InlineBlock',
                  caption: 'Koszulka - 23,89',
                ),
                ImageCaptionWidget(
                  imageUrl:
                      'https://th.bing.com/th/id/OIP.fG-wjoGsWLw6LvaFjo0LjAAAAA?rs=1&pid=ImgDetMain',
                  caption: 'Bluza - 120,99',
                ),
                ImageCaptionWidget(
                  imageUrl:
                      'https://th.bing.com/th/id/OIP.NAQAvA9CyLDN6H53J5Ps9AAAAA?w=130&h=147&c=7&r=0&o=5&dpr=1.3&pid=1.7',
                  caption: 'Spodnie - 10,21',
                ),
                ImageCaptionWidget(
                  imageUrl:
                      'https://th.bing.com/th/id/OIP.3VkKAxswfRIp9HyxitoJfgAAAA?w=148&h=138&c=7&r=0&o=5&dpr=1.3&pid=1.7',
                  caption: 'kurtka - 209,88',
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

// Importuj stronę logowania

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
      onTap: (index) {
        // Dodaj kod obsługujący przekierowanie na stronę logowania
        if (index == 4) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        }
      },
    );
  }
}

