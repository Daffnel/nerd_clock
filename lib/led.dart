import 'package:flutter/material.dart';

Widget ledLight(bool isOn) {
  return Container(
    width: 24,
    height: 24,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: isOn ? const Color(0xFFFF3030) : const Color(0xFF550000),
      boxShadow: isOn
          ? [const BoxShadow(color: Color(0x99FF3030), blurRadius: 15, spreadRadius: 3)]
          : [],
    ),
  );
}

//Widgeten för att skapa en LED lamap
class LedWidget extends StatelessWidget {
  const LedWidget({required this.number, super.key});

  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 30),
          ledLight(number & 8 != 0),
          SizedBox(height: 12),
          ledLight(number & 4 != 0),
          SizedBox(height: 12),
          ledLight(number & 2 != 0),
          SizedBox(height: 12),
          ledLight(number & 1 != 0),
        ],
      ),
    );
  }
}
