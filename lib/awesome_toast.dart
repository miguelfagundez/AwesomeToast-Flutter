library awesome_toast;

import 'package:flutter/material.dart';
import 'src/awesome_toast_const.dart';
import 'src/widgets/toast_widget.dart';
import 'src/params/awesome_toast_params.dart';

/// ToastContext
extension ToastContext on BuildContext {
  void showToast(
    String message, {
    required TextStyle style,
    Duration duration = const Duration(
      seconds: AwesomeToastConst.toastSeconds,
    ),
    Duration? transition = const Duration(
      milliseconds: AwesomeToastConst.toastMilliseconds,
    ),
    Color? backgroundColor = Colors.grey,
    BorderRadius? borderRadius = const BorderRadius.all(Radius.circular(
      AwesomeToastConst.toastBorderRadius,
    )),
    AlignmentGeometry alignment = Alignment.bottomCenter,
    IconData? icon,
    double? toastSize = AwesomeToastConst.toastSize,
    double paddingTop = AwesomeToastConst.toastPaddingTop,
    int? maxLines = AwesomeToastConst.toastMaxlines,
  }) {
    // Getting the Overlay State
    final overlayState = Overlay.of(this);

    // Create an Overlay Entry using the custom widget
    final toast = OverlayEntry(
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          top: paddingTop,
        ),
        child: ToastWidget(
          message: message,
          params: AwesomeToastParams(
            textStyle: style,
            duration: duration,
            transition: transition,
            backgroundColor: backgroundColor,
            borderRadius: borderRadius,
            alignment: alignment,
            icon: icon,
            toastSize: toastSize,
            maxLines: maxLines,
          ),
        ),
      ),
    );

    // Showing the toast on the screen
    overlayState!.insert(toast);

    // After xx seconds (duration) this widget needs to be removed
    Future.delayed(duration, toast.remove);
  }
}
