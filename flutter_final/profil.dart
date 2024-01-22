// profile_page.dart
import 'package:flutter/material.dart';
import 'conversations.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'add_clothing_page.dart';
import 'chat.dart';
import 'cloth_page.dart';
import 'search_page.dart';
import 'conversations.dart';

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Użytkownika'),
      ),
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Domyślna ikona użytkownika
                  CircleAvatar(
                    radius: 75,
                    child: Icon(
                      Icons.person,
                      size: 75,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  // Nazwa użytkownika
                  Text(
                    'Nazwa Użytkownika',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 32.0),
                  // Przyciski
                  ProfileButton(
                    label: 'Moje Produkty',
                    onPressed: () {
                      // Dodaj kod dla przycisku 'Moje Produkty'
                    },
                  ),
                  ProfileButton(
                    label: 'Historia Zakupów',
                    onPressed: () {
                      // Dodaj kod dla przycisku 'Historia Zakupów'
                    },
                  ),
                  ProfileButton(
                    label: 'Ustawienia',
                    onPressed: () {
                      // Dodaj kod dla przycisku 'Ustawienia'
                    },
                  ),
                  ProfileButton(
                    label: 'Koszyk',
                    onPressed: () {
                      // Dodaj kod dla przycisku 'Koszyk'
                    },
                  ),
                  ProfileButton(
                    label: 'Regulamin',
                    onPressed: () {
                      // Dodaj kod dla przycisku 'Regulamin'
                    },
                  ),
                  SizedBox(height: 8.0),
                  // Przycisk 'Wyloguj się'
                  SizedBox(
                    height: 40.0, // Set a fixed height for all buttons
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Dodaj kod dla przycisku 'Wyloguj się'
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                      child: Text('Wyloguj się'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}

class ProfileButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const ProfileButton({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: SizedBox(
        height: 40.0, // Set a fixed height for all buttons
        width: double.infinity, // Make the button take the full width
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(label),
        ),
      ),
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
              color: Colors.blue, // Set the background color here
              shape: BoxShape.circle, // Optional: You can set the shape
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0), // Optional: Adjust padding
              child: Icon(Icons.add,
                  color: Colors.white), // Set the icon color here
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
        // Kod obsługujący przekierowanie na odpowiednią stronę
        switch (index) {
          case 0: // Strona Główna
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomePage()),
            );
            break;
          case 1: // Strona dodawania
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => AddClothingPage()),
            );
            break;
          case 2:
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => ConversationsPage()),
            );
            break;
          case 3: // Profil
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
            break;
          // Dodaj obsługę pozostałych ikon, jeśli to konieczne
        }
      },
    );
  }
}
