// add_clothing_page.dart
import 'package:flutter/material.dart';
import 'home_page.dart';

class AddClothingPage extends StatefulWidget {
  @override
  _AddClothingPageState createState() => _AddClothingPageState();
}

class _AddClothingPageState extends State<AddClothingPage> {
  String clothingName = '';
  double clothingPrice = 0.0;
  String clothingQuality = 'Dobry'; // Default quality
  String clothingGender = 'Męski'; // Default gender
  String clothingSize = 'S'; // Default size
  String clothingDescription = ''; // Description
  String clothingBrand = ''; // Brand
  String imagePath = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dodaj Ubranie'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Button to upload a photo
              IconButton(
                icon: Icon(Icons.add_a_photo),
                onPressed: () async {
                  // Add logic to upload a photo
                  // You can use a package like image_picker to pick an image from the gallery
                  // Example: https://pub.dev/packages/image_picker
                  // Update the 'imagePath' variable with the path of the selected image
                },
              ),
              SizedBox(height: 16.0),
              // Text form field for clothing name
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    clothingName = value;
                  });
                },
                decoration: InputDecoration(labelText: 'Nazwa ubrania'),
              ),
              SizedBox(height: 16.0),
              // Text form field for clothing brand
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    clothingBrand = value;
                  });
                },
                decoration: InputDecoration(labelText: 'Marka'),
              ),
              SizedBox(height: 16.0),
              // Text form field for clothing description
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    clothingDescription = value;
                  });
                },
                decoration: InputDecoration(labelText: 'Opis'),
                maxLines: 3, // Allowing multiple lines for description
              ),
              SizedBox(height: 16.0),
              // Text form field for clothing price
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    clothingPrice = double.parse(value);
                  });
                },
                decoration: InputDecoration(labelText: 'Cena'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16.0),
              // Dropdown for clothing quality
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Stan: '),
                  DropdownButton<String>(
                    value: clothingQuality,
                    onChanged: (value) {
                      setState(() {
                        clothingQuality = value!;
                      });
                    },
                    items: ['Dobry', 'Średni', 'Słaby']
                        .map<DropdownMenuItem<String>>(
                          (String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              // Dropdown for clothing gender
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Krój: '),
                  DropdownButton<String>(
                    value: clothingGender,
                    onChanged: (value) {
                      setState(() {
                        clothingGender = value!;
                      });
                    },
                    items: ['Męski', 'Damski', 'Unisex']
                        .map<DropdownMenuItem<String>>(
                          (String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              // Dropdown for clothing size
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Rozmiar: '),
                  DropdownButton<String>(
                    value: clothingSize,
                    onChanged: (value) {
                      setState(() {
                        clothingSize = value!;
                      });
                    },
                    items: ['S', 'M', 'L', 'XL']
                        .map<DropdownMenuItem<String>>(
                          (String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              // Button to add the clothing item
              ElevatedButton(
                onPressed: () {
                  // Add logic to save the clothing item to your data source
                  // You can also navigate back to the home page or perform other actions
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Text('Dodaj Ubranie'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
