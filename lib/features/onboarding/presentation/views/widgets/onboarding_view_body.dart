import 'package:flutter/material.dart';
import 'package:metro_app/core/helpers/assets.dart';
import 'package:metro_app/core/helpers/text_styles.dart';
import 'package:metro_app/core/widgets/custom_buttom.dart';
import 'package:metro_app/features/home/presentation/views/home_view.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(height: 40),
          Expanded(child: Image.asset(AssetsData.onboarding)),
          SizedBox(height: 40),
          Text(
            'Welcome to Metro Booking',
            style: Styles.textStyle50.copyWith(fontSize: 24),
          ),
          SizedBox(height: 20),
          Text(
            'Booking your metro tickets online with your\n searching prefrences',
            style: Styles.textStyle16.copyWith(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          CustomButtom(
            text: 'Get Started',
            onPressed: () {
              //! replace it to get
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeView()),
              );
            },
          ),
          SizedBox(height: 30),
          Text(
            'Try it Now',
            style: Styles.textStyle16.copyWith(color: Colors.grey),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
