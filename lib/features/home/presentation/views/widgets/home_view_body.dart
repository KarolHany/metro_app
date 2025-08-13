import 'package:flutter/material.dart';
import 'package:metro_app/core/constants/app_constants.dart';
import 'package:metro_app/core/helpers/text_styles.dart';
import 'package:metro_app/core/widgets/custom_buttom.dart';
import 'package:metro_app/core/widgets/custom_container.dart';
import 'package:metro_app/features/home/presentation/views/widgets/drop_down_container_child.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Where Do You Want to Go For Today?',
                style: Styles.textStyle30,
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: wightColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: DropDownContainerChild(),
              ),

              SizedBox(height: 40),
              Text(
                'The Nearest Station to Your Current Location',
                style: Styles.textStyle16.copyWith(color: magentaColor),
              ),
              SizedBox(height: 15),
              CustomContainer(
                color: wightColor,
                mediaQueryHight: .1,
                borderRadius: 30,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Nearest Station',
                        textAlign: TextAlign.start,
                        style: Styles.textStyle20.copyWith(color: magentaColor),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.location_on, color: neonColor),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'The Closest Station to The Nearest Place You Want to Go',
                style: Styles.textStyle16.copyWith(color: magentaColor),
              ),
              SizedBox(height: 15),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter The Place',
                ),
              ),
              SizedBox(height: 10),
              CustomButtom(text: 'Submit', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
