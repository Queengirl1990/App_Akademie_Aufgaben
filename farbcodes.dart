import 'package:flutter/material.dart';

const Color darkRed = Color(0xFFAC5859);
const Color lightGrey = Color(0xFFC7C9D9);
const Color darkMode = Color(0xFF343131);
const Color snowWhite = Color(0xFFFAFAFC);
const Color cremeColor = Color(0xFFD0A79C);
const Color guelden = Color(0xFFFEC89A);

// verschenken
Map<String, Map<String, String>> giveAway = {
  'better with someone else': {
    'title': 'better with someone else',
    'author': 'Ina Taus',
    'year': '2023',
    'image': 'assets/images/better-with.jpeg',
  },
  'Friends, Lovers and the Big Terrible Thing': {
    'title': 'Friends, Lovers and the Big Terrible Thing',
    'author': 'Matthew Perry',
    'year': '2022',
    'image': 'assets/images/matt-perry.jpeg',
  },
  'Eine letzte Chance I': {
    'title': 'Eine letzte Chance',
    'author': 'Jaliah J.',
    'year': '2021',
    'image': 'assets/images/eine.jpeg',
  }
};

//Avatar
Widget myCircularAvatar() {
  return Row(
    children: [
      const SizedBox(width: 20),
      Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(1, 1),
            ),
          ],
        ),
        child: ClipOval(
          child: Image.asset(
            'assets/images/avatar.png',
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ],
  );
}
