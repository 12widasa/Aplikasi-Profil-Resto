import 'package:flutter/material.dart';

const MaterialColor primaryColor = Colors.indigo;
const Color secondaryColor = Colors.white;
const Color accentColor = Color(0xFFEC7063);
const Color backgroundColor = Color(0xFFF7F9FC);

const Gradient appBarGradient = LinearGradient(
  colors: [Color(0xFF3A6073), Color(0xFF16222A)],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

const TextStyle titleStyle1 = TextStyle(
  fontSize: 26,
  fontWeight: FontWeight.bold,
  color: Color.fromARGB(221, 255, 255, 255),
);
const TextStyle titleStyle = TextStyle(
  fontSize: 26,
  fontWeight: FontWeight.bold,
  color: Colors.black87,
);

const TextStyle descriptionStyle = TextStyle(
  fontSize: 16,
  color: Colors.black87,
  height: 1.5,
);

const TextStyle bulletItemStyle = TextStyle(
  fontSize: 15,
  color: Colors.black54,
);

BoxDecoration iconButtonDecoration = BoxDecoration(
  color: accentColor,
  shape: BoxShape.circle,
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 10,
      offset: Offset(0, 5),
    ),
  ],
);

BoxDecoration imageBoxDecoration(String imagePath) => BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 8,
          offset: Offset(0, 4),
        ),
      ],
      image: DecorationImage(
        image: AssetImage(imagePath),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
          Colors.black.withOpacity(0.3),
          BlendMode.darken,
        ), 
      ),
    );
