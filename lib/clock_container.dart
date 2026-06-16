import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

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

      _clockDigits = _timeString.split(':').map(int.parse).toList();

      debugPrint("Klockan: $_clockDigits");
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
    return Container(child: Text("Mothha fuc...."));
  }
}
