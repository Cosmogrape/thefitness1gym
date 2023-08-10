import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@immutable
class ExpandablePanel extends StatefulWidget {
  const ExpandablePanel({
    super.key,
    required this.header,
    required this.body,
    this.icon,
    this.iconSize,
    this.initiallyExpanded = false,
    this.showArrow = true,
    this.customArrow,
    this.color,
    this.backgroundColor,
    this.headerPadding,
    this.bodyPadding,
    this.borderRadius,
  });

  final Widget header;
  final Widget body;
  final IconData? icon;
  final double? iconSize;
  final bool initiallyExpanded;
  final bool showArrow;
  final Widget? customArrow;
  final bool useInkWell;
  final Color? color;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? headerPadding;
  final EdgeInsetsGeometry? bodyPadding;
  final BorderRadiusGeometry? borderRadius;

  @override
  State<ExpandablePanel> createState() => _ExpandablePanelState();
}

class _ExpandablePanelState extends State<ExpandablePanel> {
  late bool _isExpanded;

  void _toggle() {
    setState(() => _isExpanded = !_isExpanded);
  }

  @override
  initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);

    final border = widget.borderRadius == null ? null : RoundedRectangleBorder(borderRadius: widget.borderRadius!);

    final duration = const Duration(milliseconds: 200);

    return Card(
      shape: border,
      color: widget.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: widget.headerPadding,
            decoration: BoxDecoration(
              borderRadius: widget.borderRadius,
              color: widget.backgroundColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (widget.icon != null) Icon(widget.icon, color: widget.color, size: widget.iconSize),
                    if (widget.icon != null && widget.headerPadding != null)
                      SizedBox(
                        width: widget.headerPadding!.horizontal / 2,
                      ),
                    widget.header,
                  ],
                ),
                if (widget.showArrow)
                  widget.customArrow ??
                      IconButton(
                        icon: AnimatedScale(
                          scale: _isExpanded ? -1 : 1,
                          duration: duration,
                          child: const Icon(FontAwesomeIcons.chevronDown),
                        ),
                        color: widget.color,
                        onPressed: _toggle,
                      ),
              ],
            ),
          ),
          AnimatedCrossFade(
            duration: duration,
            firstCurve: Curves.easeOut,
            secondCurve: Curves.easeOut,
            crossFadeState: _isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            firstChild: Container(),
            secondChild: Container(
              padding: widget.bodyPadding,
              child: widget.body,
            ),
          ),
        ],
      ),
    );
  }
}
