import 'package:flutter/material.dart';

class AwesomeToastParams {
  AwesomeToastParams({
    required this.textStyle,
    this.duration = const Duration(seconds: 3),
    this.transition = const Duration(milliseconds: 250),
    this.backgroundColor,
    this.borderRadius,
    this.alignment = Alignment.bottomCenter,
    this.icon,
    this.toastSize = 300.0,
    this.maxLines,
  });

  final TextStyle textStyle;
  final Duration duration;
  final Duration transition;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final AlignmentGeometry alignment;
  final IconData? icon;
  final double? toastSize;
  final int? maxLines;
}
