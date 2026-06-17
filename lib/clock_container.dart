import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

import 'package:nerd_clock/led.dart';

class ClockContainer extends StatefulWidget {
  const ClockContainer({super.key});

  @override
  State<ClockContainer> createState() => _ClockContainerState();
}

class _ClockContainerState extends State<ClockContainer> {
  String _timeString = "";
  List<int> _clockDigits = [];

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('HH:mm:ss').format(dateTime);
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;

      //trim and Split each digit
      _clockDigits = _timeString
          .split(':')
          .expand((number) => number.toString().split('').map(int.parse))
          .toList();
    });
  }

  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ..._clockDigits.map((item) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: (LedWidget(number: item)),
              );
            }),
          ],
        ),
        SizedBox(height: 16),
        // Text(_timeString, style: TextStyle(letterSpacing: 18, color: Colors.white, fontSize: 24)),
      ],
    );
  }
}
