import 'package:flutter/material.dart';

class SearchyCard extends StatelessWidget {
  const SearchyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Rounded corners for the card
      ),
      elevation: 4, // Shadow elevation
      child: Stack(
        children: [
          ClipRRect(
            borderRadius:
                BorderRadius.circular(20), // Match the card's border radius
            child: Image.asset(
              'assets/search.png', // Replace with your image path
              height: 210, // Set the height of the image
              width: double.infinity, // Set width to fill the card
              fit: BoxFit.fill, // Adjust the image to cover the area
            ),
          ),
        ],
      ),
    );
  }
}

class Searchy extends StatelessWidget {
  const Searchy({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white, // Background color
        borderRadius: BorderRadius.circular(40), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.deepOrangeAccent.withOpacity(0.2), // Subtle shadow
            blurRadius: 10,
            offset: const Offset(0, 4), // Shadow position
          ),
        ],
      ),
      child: TextField(
        textAlign: TextAlign.right, // Align text to the right
        textDirection: TextDirection.rtl, // Set text direction to right-to-left
        decoration: InputDecoration(
          hintText: 'بحث', // Arabic for "Search"
          hintStyle: const TextStyle(
              color: Color.fromARGB(255, 189, 189, 189)), // Hint text color
          border: InputBorder.none, // Remove the underline
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
                color: Colors.white, width: 2), // Focused border color
          ),
          prefixIcon:
              const Icon(Icons.search, color: Colors.blue), // Icon color
          contentPadding: const EdgeInsets.symmetric(
              vertical: 15, horizontal: 20), // Padding inside the text field
        ),
      ),
    );
  }
}
