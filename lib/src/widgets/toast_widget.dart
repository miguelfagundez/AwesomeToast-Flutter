import 'package:awesome_toast/src/params/awesome_toast_params.dart';
import 'package:flutter/material.dart';

class ToastWidget extends StatefulWidget {
  const ToastWidget({
    Key? key,
    required this.message,
    required this.params,
  }) : super(key: key);

  final String message;
  final AwesomeToastParams params;

  @override
  State<ToastWidget> createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<ToastWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController opacity;

  @override
  void initState() {
    super.initState();

    final params = widget.params;

    opacity = AnimationController(
      vsync: this,
      duration: params.transition,
    )..forward();

    final startFadeOutAt = params.duration - params.transition;
    Future.delayed(startFadeOutAt, opacity.reverse);
  }

  @override
  void dispose() {
    opacity.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final params = widget.params;

    return FadeTransition(
      opacity: opacity,
      child: Align(
        alignment: params.alignment,
        child: Container(
          decoration: BoxDecoration(
            color: params.backgroundColor,
            borderRadius: params.borderRadius,
          ),
          margin: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: MediaQuery.of(context).size.height * .125,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 16.0,
          ),
          child: SizedBox(
            width: params.toastSize,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  params.icon,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: DefaultTextStyle(
                    style: params.textStyle,
                    child: Text(
                      widget.message,
                      overflow: TextOverflow.ellipsis,
                      maxLines: params.maxLines,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
