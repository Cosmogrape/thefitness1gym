import 'package:flutter/material.dart';

@immutable
class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  MaterialPageRoute get route => MaterialPageRoute(builder: (context) => const CalendarPage());

  @override
  State<StatefulWidget> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "calendar",
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Calendar'),
        ),
        body: Center(
          child: Text('Calendar'),
        ),
      ),
    );
  }
}
