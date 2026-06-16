import 'package:flutter/material.dart';
import 'package:nerd_clock/led.dart';
import 'clock_container.dart';

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 10, 26, 58),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Nerd Clock", style: TextStyle(color: Colors.white, fontSize: 34)),

              //Row(children: [LedWidget(number: 5), LedWidget(number: 3)]),
              ClockContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
