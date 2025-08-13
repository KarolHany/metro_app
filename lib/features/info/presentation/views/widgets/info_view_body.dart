import 'package:flutter/material.dart';
import 'package:metro_app/core/constants/app_constants.dart';
import 'package:metro_app/core/helpers/text_styles.dart';
import 'package:metro_app/core/widgets/custom_container.dart';
import 'package:metro_app/features/info/presentation/views/widgets/route_details.dart';

class InfoViewBody extends StatelessWidget {
  const InfoViewBody({
    super.key,
    required this.pathOfTrip,
    required this.description, required this.countOfStations,
  });
  final dynamic pathOfTrip;
  final String description;
  final int countOfStations;


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
                        'Count Of Station : ${countOfStations - 1} st',
                        style: Styles.textStyle20.copyWith(color: wightColor),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Time To Arrive   : ${(countOfStations - 1) * 3} m',
                        style: Styles.textStyle20.copyWith(color: wightColor),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Price Of Ticket  : ${calculatePrice(countOfStations - 1)} eg',
                        style: Styles.textStyle20.copyWith(color: wightColor),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),

              Text('Description', style: Styles.textStyle30),
              const SizedBox(height: 15),
              CustomContainer(
                borderRadius: 20,
                mediaQueryHight: .2,
                color: wightColor,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    '$description',
                    style: Styles.textStyle16.copyWith(color: magentaColor),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Text('Route', style: Styles.textStyle30),
              const SizedBox(height: 15),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: RouteDetails(pathOfRoute: pathOfTrip),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

int calculatePrice(int countOfStations){
   if (countOfStations <= 9) {
                  return 8;
                }
                else if (countOfStations <= 16) {
                  return 10;
                }
                else if (countOfStations <= 23) {
                  return 15;
                }
                else {
                 return 20;
                }
}