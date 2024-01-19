// signup_page.dart
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'login_page.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _streetController = TextEditingController();
  TextEditingController _apartmentNumberController = TextEditingController();
  TextEditingController _postalCodeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Strona Rejestracji'),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                controller: _firstNameController,
                decoration: InputDecoration(
                  labelText: 'Imię',
                ),
              ),
              TextField(
                controller: _lastNameController,
                decoration: InputDecoration(
                  labelText: 'Nazwisko',
                ),
              ),
              TextField(
                controller: _cityController,
                decoration: InputDecoration(
                  labelText: 'Miasto',
                ),
              ),
              TextField(
                controller: _streetController,
                decoration: InputDecoration(
                  labelText: 'Ulica',
                ),
              ),
              TextField(
                controller: _apartmentNumberController,
                decoration: InputDecoration(
                  labelText: 'Numer mieszkania',
                ),
              ),
              TextField(
                controller: _postalCodeController,
                decoration: InputDecoration(
                  labelText: 'Kod pocztowy',
                ),
              ),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Nazwa użytkownika',
                ),
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Adres email',
                ),
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Hasło',
                ),
              ),
              TextField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Potwierdź hasło',
                ),
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  String username = _usernameController.text;
                  String password = _passwordController.text;
                  String confirmPassword = _confirmPasswordController.text;
                  String firstName = _firstNameController.text;
                  String lastName = _lastNameController.text;
                  String city = _cityController.text;
                  String street = _streetController.text;
                  String apartmentNumber = _apartmentNumberController.text;
                  String postalCode = _postalCodeController.text;
                  String email = _emailController.text;

                  if (password == confirmPassword) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Błąd rejestracji'),
                        content: Text('Hasła nie są identyczne.'),
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
                child: Text('Potwierdź rejestrację'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
