
import 'package:flutter/material.dart';
import 'package:flutter_challenge/styles.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ScreenPanel extends HookWidget {
  const ScreenPanel({
    Key? key,
    required this.child,
    this.textStyle,
    this.padding,
    this.color = Colors.white,
  }) : super(key: key);

  final Widget child;
  final Color color;
  final EdgeInsets? padding;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final totalHeight = MediaQuery.of(context).size.height;
    final controller = useScrollController();

    final paddingValue = getValueForScreenType(
      context: context,
      mobile: 28.0,
      tablet: 80.0,
    );

    return SingleChildScrollView(
      controller: controller,
      child: Scrollbar(
        controller: controller,
        child: DefaultTextStyle(
          style: textStyle ?? appTextStyle(),
          child: Container(
            color: color,
            constraints: BoxConstraints(
              minHeight: totalHeight,
            ),
            padding: padding ?? EdgeInsets.all(paddingValue),
            child: SafeArea(child: child),
          ),
        ),
      ),
    );
  }
}
