import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thefitness1gym/assets/values/predefined_size.dart';
import 'package:thefitness1gym/widgets/animated_tap.dart';

class CalendarReminder extends StatelessWidget {
  const CalendarReminder({
    super.key,
    required this.text,
    this.onTap,
  });

  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: AnimatedTap(
        tapDownOpacity: .6,
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(PredefinedSize.radiusMedium),
          ),
          color: Colors.green.shade900.withOpacity(.5),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: PredefinedSize.paddingBig, vertical: PredefinedSize.paddingMedium),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(FontAwesomeIcons.calendar, color: Colors.green.shade200),
                SizedBox(width: PredefinedSize.paddingMedium),
                Text(
                  text,
                  style: theme.textTheme.bodyLarge!.copyWith(
                    color: Colors.green.shade200,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
