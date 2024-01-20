import 'package:calendar/calendar.dart';
import 'package:flutter/material.dart';

//import 'dart:collection';

void main() {
  runApp(myapp());
}

class myapp extends StatefulWidget {
  const myapp({super.key});

  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calendar",
      home: NepaliCalendar(),
      theme: ThemeData(primaryColor: Colors.blue),
    );
  }
}
