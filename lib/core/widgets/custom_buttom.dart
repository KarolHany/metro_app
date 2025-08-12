import 'package:flutter/material.dart';
import 'package:metro_app/core/constants/app_constants.dart';
import 'package:metro_app/core/helpers/text_styles.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({super.key, required this.text, this.onPressed});
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: magentaColor,
        minimumSize: Size(double.infinity, 50),
      ),
      onPressed: onPressed,
      child: Text(text, style: Styles.textStyle18.copyWith(color: wightColor)),
    );
  }
}
