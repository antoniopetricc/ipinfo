import 'package:flutter/material.dart';
import 'package:ipinfo/styles.dart';
import 'package:ipinfo/widgets/ease_in.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final bool loading;
  final Function() onPressed;

  const CustomButton(
      {required this.text,
      required this.onPressed,
      Key? key,
      required this.loading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EaseIn(
      onTap: onPressed,
      child: Container(
        decoration: const BoxDecoration(
          color: Styles.kPrimary,
          borderRadius: Styles.kRadius,
        ),
        height: 56,
        width: 270,
        child: Center(
          child: loading
              ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )
              : Text(text, style: Styles.kSubtitle),
        ),
      ),
    );
  }
}
