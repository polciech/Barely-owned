import 'package:flutter/material.dart';
import 'login_page.dart';
import 'search_page.dart';
import 'add_clothing_page.dart';
import 'cloth_page.dart';

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
      body: SingleChildScrollView(
        child: Center(
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 0.0,
              mainAxisSpacing: 0.0,
            ),
            itemCount: clothingItems.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ImageCaptionWidget(
                  imageUrl: clothingItems[index]['imageUrl'] ?? '',
                  caption: clothingItems[index]['caption'] ?? '',
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}

final List<Map<String, String>> clothingItems = [
  {
    'imageUrl':
        'https://patrioty.pl/17651-medium_default/koszulka-orzel-styl.jpg',
    'caption': '38,99',
  },
  {
    'imageUrl':
        'https://th.bing.com/th/id/OIP.VqN6aKK2mipVDRAAyHlHcQAAAA?w=136&h=147&c=7&r=0&o=5&dpr=1.3&pid=1.7',
    'caption': '40,54',
  },
  {
    'imageUrl':
        'https://th.bing.com/th/id/OIP.c5K2w9TmEwTHSPyb6d_R5AHaIZ?w=89&h=90&c=1&rs=1&qlt=90&r=0&dpr=1.3&pid=InlineBlock',
    'caption': '23,89',
  },
  {
    'imageUrl':
        'https://th.bing.com/th/id/OIP.fG-wjoGsWLw6LvaFjo0LjAAAAA?rs=1&pid=ImgDetMain',
    'caption': '120,99',
  },
  {
    'imageUrl':
        'https://th.bing.com/th/id/OIP.NAQAvA9CyLDN6H53J5Ps9AAAAA?w=130&h=147&c=7&r=0&o=5&dpr=1.3&pid=1.7',
    'caption': '10,21',
  },
  {
    'imageUrl':
        'https://th.bing.com/th/id/OIP.3VkKAxswfRIp9HyxitoJfgAAAA?w=148&h=138&c=7&r=0&o=5&dpr=1.3&pid=1.7',
    'caption': '209,88',
  },
  {
    'imageUrl':
        'https://a.allegroimg.com/original/1e358d/745a09dc470294f8a5c7d3be47d7',
    'caption': '100,00',
  },
  {
    'imageUrl':
        'https://a.allegroimg.com/s1024/0c1ce1/5c8ae2a1468a9c8b92971b218bec',
    'caption': '40,00',
  },
  {
    'imageUrl':
        'https://costa.pl/61769/czapeczka-z-daszkiem-i-z-wiatraczkiem-.jpg',
    'caption': '20,00',
  },
  {
    'imageUrl':
        'https://bin.smyk.com/media/product/1600/1/czapka-z-daszkiem-chlopieca-minionki-5878513.jpg',
    'caption': '39,99',
  },
];

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
        InkWell(
          onTap: () {
            // Navigate to ProductPage when the image is tapped
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductPage(
                  imageUrl: imageUrl,
                  caption: caption,
                ),
              ),
            );
          },
          child: Image.network(
            imageUrl,
            width: 180,
            height: 120,
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        SizedBox(height: 7.0),
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
        if (index == 3) {}
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
