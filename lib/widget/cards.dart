import 'package:flutter/material.dart';

Widget buildCard(
  BuildContext context, {
  required String title,
  required String imageUrl,
  required Color color,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 8, // Increased elevation for a more pronounced shadow
      shadowColor: Colors.deepOrangeAccent.withOpacity(0.5), // Shadow color
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.2), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius:
                  BorderRadius.circular(16.0), // Match the card's border radius
              child: Image.asset(
                imageUrl,
                height: 120, // Set the height of the image
                width: double.infinity, // Set width to fill the card
                fit: BoxFit.cover, // Adjust the image to cover the area
              ),
            ),
            const SizedBox(height: 12), // Reduced space for a tighter layout
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0), // Added horizontal padding
              child: Text(
                title,
                textAlign: TextAlign.center, // Center the text
                style: const TextStyle(
                  fontSize: 25, // Slightly reduced font size
                  color: Color.fromRGBO(193, 108, 55, 1),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8), // Space between title and bottom
          ],
        ),
      ),
    ),
  );
}
