import 'package:flutter/material.dart';
import 'package:metro_app/core/helpers/assets.dart';
import 'package:metro_app/core/helpers/text_styles.dart';

class SplashBodyWidget extends StatelessWidget {
  const SplashBodyWidget({super.key, required this.slidingAnimation});

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AssetsData.logo,
            width: 70,
            height: 70,
            fit: BoxFit.contain,
          ),
          AnimatedBuilder(
            animation: slidingAnimation,
            builder: (context, _) {
              return SlideTransition(
                position: slidingAnimation,
                child: Text(
                  ' metro',
                  style: Styles.textStyle50,
                  textAlign: TextAlign.center,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
