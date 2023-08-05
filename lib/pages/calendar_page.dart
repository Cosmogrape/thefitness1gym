import "package:date_field/date_field.dart";
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thefitness1gym/assets/values/predefined_padding.dart';
import 'package:thefitness1gym/widgets/calendar_widgets/calendar_day/calendar_item.dart';
import 'package:thefitness1gym/widgets/calendar_widgets/calendar_day/calendar_list.dart';
import 'package:thefitness1gym/widgets/page_title.dart';

@immutable
class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  static MaterialPageRoute get route => MaterialPageRoute(builder: (context) => const CalendarPage());

  @override
  State<StatefulWidget> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const PageTitle("Upcoming events"),
        backgroundColor: theme.colorScheme.background,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addEvent,
        backgroundColor: theme.colorScheme.surface,
        child: Icon(Icons.add, color: theme.colorScheme.primary),
      ),
      body: Hero(
        tag: "calendar",
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: PredefinedPadding.big, vertical: PredefinedPadding.regular),
          children: [
            //Hero(tag: "calendar_reminder", child: const Text("Calendar")),
            CalendarList(
              items: [
                CalendarItem(
                  text: "Aerobatics with Samir",
                  date: DateTime(2023, 10, 1, 18, 30),
                ),
                CalendarItem(
                  text: "Aerobatics with Samir",
                  date: DateTime(2023, 8, 5, 19, 30),
                ),
                CalendarItem(
                  text: "Wall staring competition",
                  date: DateTime(2022, 8, 4, 16, 45),
                ),
                CalendarItem(
                  text: "Wall staring competition",
                  date: DateTime(2021, 8, 5, 16, 45),
                ),
                CalendarItem(
                  text: "Wall staring competition",
                  date: DateTime(2021, 8, 5, 12, 45),
                ),
                CalendarItem(
                  text: "Wall staring competition",
                  date: DateTime(2022, 8, 5, 4, 45),
                ),
                CalendarItem(
                  text: "Aerobatics with Samir",
                  date: DateTime(2023, 10, 1, 18, 30),
                ),
                CalendarItem(
                  text: "Wall staring competition",
                  date: DateTime(2023, 8, 6, 16, 45),
                ),
                CalendarItem(
                  text: "Tea party",
                  date: DateTime(2023, 10, 2, 15, 15),
                ),
                CalendarItem(
                  text: "Tea party while staring at a wall",
                  date: DateTime(2023, 11, 3, 5, 15),
                ),
                CalendarItem(
                  text: "Tea party while staring at a wall",
                  date: DateTime(2023, 12, 7, 2, 19),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> addEvent() async {
    final dialog = AlertDialog(
      title: const Text("Add event"),
      actions: [
        IconButton(
          onPressed: Navigator.of(context).pop,
          icon: const Icon(FontAwesomeIcons.xmark),
        ),
        TextButton.icon(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const AlertDialog(title: Text("Confirm tapped"));
              },
            );
          },
          icon: const Icon(FontAwesomeIcons.check),
          label: const Text("Confirm"),
        ),
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const TextField(
            decoration: InputDecoration(
              labelText: "Event name",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: PredefinedPadding.big),
          DateTimeField(
            decoration: const InputDecoration(
              labelText: "Date and time",
              border: OutlineInputBorder(),
            ),
            firstDate: DateTime.now(),
            selectedDate: DateTime.now(),
            onDateSelected: (date) {},
          ),
        ],
      ),
    );
    await showDialog(context: context, builder: (_) => dialog);
  }
}
