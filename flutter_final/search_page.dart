import 'package:flutter/material.dart';
import 'conversations.dart';
import 'add_clothing_page.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'add_clothing_page.dart';
import 'chat.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<String> suggestions = ['koszula', 'koszulka', 'koszula damska'];
  List<String> filteredSuggestions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wyszukiwanie'),
        backgroundColor: Colors.blue, // Kolor dla paska AppBar
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Tutaj możesz dodać logikę obsługi przycisku wyszukiwania
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Wyszukaj...',
                  fillColor: Colors.white, // Kolor tła dla pola wyszukiwania
                  filled: true,
                ),
                onChanged: (value) {
                  // Tutaj możesz dodać logikę obsługi zmiany tekstu
                  filterSuggestions(value);
                },
              ),
            ),
          ),
        ],
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
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(filteredSuggestions[index]),
                    onTap: () {
                      // Tutaj możesz dodać logikę obsługi wyboru podpowiedzi
                    },
                  );
                },
                separatorBuilder: (context, index) => Divider(),
                itemCount: filteredSuggestions.length,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }

  void filterSuggestions(String query) {
    filteredSuggestions.clear();
    if (query.length >= 3) {
      // Filtruj podpowiedzi tylko po wprowadzeniu co najmniej 3 liter
      for (String suggestion in suggestions) {
        if (suggestion.toLowerCase().contains(query.toLowerCase())) {
          filteredSuggestions.add(suggestion);
        }
      }
    }
    setState(() {});
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
              color: Colors.blue, // Set the background color here
              shape: BoxShape.circle, // Optional: You can set the shape
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0), // Optional: Adjust padding
              child: Icon(Icons.home,
                  color: Colors.white), // Set the icon color here
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
