import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.color,
    required this.child,
    required this.mediaQueryHight,
    required this.borderRadius,
  });

  final Color? color;
  final Widget? child;
  final double mediaQueryHight;
  final double borderRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * mediaQueryHight,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}
