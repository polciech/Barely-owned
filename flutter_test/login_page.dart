// login_page.dart
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'signup_page.dart';
import 'add_clothing_page.dart';

void main() {
  runApp(LoginPage());
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.all(8.0),
                color: Colors.green,
                child: Text(
                  'BarelyOwned',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                String username = _usernameController.text;
                String password = _passwordController.text;

                // Przykładowa logika autentykacji - zastępuj to swoją logiką
                if (username == '' && password == '') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Authentication Failed'),
                      content: Text('Invalid username or password.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: SizedBox(
                width: 200.0,
                height: 40.0, // Set a fixed width for both buttons
                child: Center(child: Text('Login')),
              ),
            ),
            Text(''),
            OutlinedButton(
                onPressed: () {
                  // Nawiązanie do pliku z rejestracją (signup_page.dart)
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupPage()),
                  );
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.blue), // Set outline color
                  textStyle: TextStyle(color: Colors.blue), // Set text color
                ),
                child: SizedBox(
                  width: 200.0,
                  height: 40.0, // Set a fixed width for both buttons
                  child: Center(child: Text('Zarejestruj się')),
                )),
          ],
        ),
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
              color: Colors.blue, // Set the background color here
              shape: BoxShape.circle, // Optional: You can set the shape
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0), // Optional: Adjust padding
              child: Icon(Icons.person,
                  color: Colors.white), // Set the icon color here
            ),
          ),
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
