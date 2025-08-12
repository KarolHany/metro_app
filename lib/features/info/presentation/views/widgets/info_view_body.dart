import 'package:flutter/material.dart';
import 'package:metro_app/core/constants/app_constants.dart';
import 'package:metro_app/core/helpers/text_styles.dart';
import 'package:metro_app/core/widgets/custom_container.dart';
import 'package:metro_app/features/info/presentation/views/widgets/route_details.dart';

class InfoViewBody extends StatelessWidget {
  const InfoViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Main Info', style: Styles.textStyle30),
              const SizedBox(height: 15),
              CustomContainer(
                borderRadius: 20,
                mediaQueryHight: .2,
                color: magentaColor,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Count Of Station : 5 st',
                        style: Styles.textStyle20.copyWith(color: wightColor),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Time To Arrive   : 20 m',
                        style: Styles.textStyle20.copyWith(color: wightColor),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Price Of Ticket  : 6 eg',
                        style: Styles.textStyle20.copyWith(color: wightColor),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),

              Text('Route', style: Styles.textStyle30),
              const SizedBox(height: 15),

              RouteDetails(),
              SizedBox(height: 30),
              Text('Description', style: Styles.textStyle30),
              CustomContainer(
                borderRadius: 20,
                mediaQueryHight: .2,
                color: wightColor,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'From Helwan to Downtown Cairo:\n Start at Helwan Station (Line 1 - Red Line) \n Take train toward El Marg \n Exit at Sadat Station (Tahrir Square) - 35 min ride \n Transfer to Line 2 here for Giza/Dokki',
                    style: Styles.textStyle16.copyWith(color: magentaColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
