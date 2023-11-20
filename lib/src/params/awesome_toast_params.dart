import 'package:awesome_toast/src/awesome_toast_const.dart';
import 'package:flutter/material.dart';

class AwesomeToastParams {
  AwesomeToastParams({
    required this.textStyle,
    this.duration = const Duration(seconds: AwesomeToastConst.toastSeconds),
    this.transition =
        const Duration(milliseconds: AwesomeToastConst.toastMilliseconds),
    this.backgroundColor,
    this.borderRadius,
    this.alignment = Alignment.bottomCenter,
    this.icon,
    this.toastSize = AwesomeToastConst.toastSize,
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
