import 'package:flutter/material.dart';
import 'login_page.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wyszukiwanie'),
      ),
      body: Padding(
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
            // Tutaj możesz umieścić widgety wyświetlające wyniki wyszukiwania
          ],
        ),
      ),
      bottomNavigationBar:
          CustomBottomNavigationBar(), // Dodane bottomNavigationBar
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
