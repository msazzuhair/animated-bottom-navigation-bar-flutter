import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/src/bubble_selection_painter.dart';
import 'package:animated_bottom_navigation_bar/src/tab_item.dart';

class NavigationBarItem extends StatelessWidget {
  final bool isActive;
  final double bubbleRadius;
  final double maxBubbleRadius;
  final Color? bubbleColor;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? activeLabelColor;
  final Color? inactiveLabelColor;
  final IconData? iconData;
  final double iconScale;
  final double? iconSize;
  final String? label;
  final double? labelSize;
  final VoidCallback onTap;
  final Widget? child;

  NavigationBarItem({
    required this.isActive,
    required this.bubbleRadius,
    required this.maxBubbleRadius,
    required this.bubbleColor,
    required this.activeColor,
    required this.inactiveColor,
    required this.iconData,
    required this.iconScale,
    required this.iconSize,
    required this.onTap,
    this.child,
    this.label,
    this.labelSize,
    this.activeLabelColor,
    this.inactiveLabelColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox.expand(
        child: CustomPaint(
          painter: BubblePainter(
            bubbleRadius: isActive ? bubbleRadius : 0,
            bubbleColor: bubbleColor,
            maxBubbleRadius: maxBubbleRadius,
          ),
          child: InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: Transform.scale(
                      scale: isActive ? iconScale : 1,
                      child: TabItem(
                        isActive: isActive,
                        iconData: iconData,
                        iconSize: iconSize,
                        activeColor: activeColor,
                        inactiveColor: inactiveColor,
                        child: child,
                      ),
                    ),
                  ),
                  label != null ? Text(
                    label!,
                    style: TextStyle(
                        color: isActive ? activeLabelColor : inactiveLabelColor,
                        fontSize: labelSize ?? 11
                    ),
                  ) : Container(),
                ],
              ),
            ),
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}
