import "package:date_field/date_field.dart";
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thefitness1gym/values/predefined_padding.dart';
import 'package:thefitness1gym/values/predefined_radius.dart';
import 'package:thefitness1gym/values/predefined_size.dart';
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
  late ScrollController _scrollController;
  bool _scrolledDown = false;

  void _scrollListener() {
    final direction = _scrollController.position.userScrollDirection;
    final isForward = direction == ScrollDirection.reverse;
    setState(() => _scrolledDown = isForward);
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    const gradientDuration = Duration(seconds: 1);
    const duration = Duration(milliseconds: 300);
    const double scaleOnScroll = .8;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const PageTitle("Upcoming events"),
        backgroundColor: theme.colorScheme.background,
      ),
      floatingActionButton: AnimatedOpacity(
        duration: duration,
        curve: Curves.easeOut,
        opacity: _scrolledDown ? 0 : 1,
        child: AnimatedScale(
          duration: duration,
          curve: Curves.easeOut,
          scale: _scrolledDown ? scaleOnScroll : 1,
          child: FloatingActionButton(
            onPressed: addEvent,
            backgroundColor: theme.colorScheme.surface,
            child: Icon(Icons.add, color: theme.colorScheme.primary),
          ),
        ),
      ),
      body: Hero(
        tag: "calendar",
        child: Stack(
          children: [
            ListView(
              controller: _scrollController,
              padding: const EdgeInsets.only(
                left: PredefinedPadding.big,
                right: PredefinedPadding.big,
                top: PredefinedPadding.regular,
                bottom: PredefinedPadding.huge,
              ),
              children: [
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
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: AnimatedOpacity(
                duration: gradientDuration,
                curve: Curves.easeOut,
                opacity: _scrolledDown ? 0 : 1,
                child: Container(
                  height: PredefinedSize.fab * 2,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        theme.colorScheme.background.withOpacity(0.0),
                        theme.colorScheme.background.withOpacity(0.5),
                        theme.colorScheme.background.withOpacity(0.8),
                        theme.colorScheme.background.withOpacity(1.0),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: PredefinedPadding.medium,
              left: PredefinedPadding.regular,
              child: AnimatedOpacity(
                duration: duration,
                curve: Curves.easeOut,
                opacity: _scrolledDown ? 0 : 1,
                child: AnimatedScale(
                  duration: duration,
                  curve: Curves.easeOut,
                  scale: _scrolledDown ? scaleOnScroll : 1,
                  child: TextButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.surface,
                      fixedSize: const Size(PredefinedSize.fab * 5, PredefinedSize.fab),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(PredefinedRadius.regular),
                      ),
                    ),
                    onPressed: () {},
                    icon: const Icon(FontAwesomeIcons.calendarCheck),
                    label: const Text("Book now"),
                  ),
                ),
              ),

              // ElevatedButton(
              //   onPressed: () {},
              //   style: ElevatedButton.styleFrom(
              //     fixedSize: const Size(250, 50),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(PredefinedRadius.small),
              //     ),
              //   ),
              //   child: Text(
              //     "Book now",
              //     style: Theme.of(context).textTheme.titleMedium?.copyWith(
              //           fontWeight: FontWeight.bold,
              //           color: Theme.of(context).colorScheme.primary,
              //         ),
              //   ),
              // ),
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
