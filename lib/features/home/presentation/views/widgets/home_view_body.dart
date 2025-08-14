import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metro_app/core/constants/app_constants.dart';
import 'package:metro_app/core/helpers/text_styles.dart';
import 'package:metro_app/core/widgets/custom_buttom.dart';
import 'package:metro_app/core/widgets/custom_container.dart';
import 'package:metro_app/features/home/cubit/home_cubit.dart';
import 'package:metro_app/features/home/presentation/views/widgets/drop_down_container_child.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeNearestStationFound) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Nearest station found: ${state.nearestStation}'),
              backgroundColor: Colors.green,
            ),
          );
        } else if (state is HomeError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        }
      },
      builder: (context, state) {
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
                    child: const DropDownContainerChild(),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              _getNearestStationText(state),
                              textAlign: TextAlign.start,
                              style: Styles.textStyle20.copyWith(
                                color: _getNearestStationColor(state),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // Directly find nearest station and populate dropdown
                            context.read<HomeCubit>().findNearestStation();
                          },
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
                  CustomButtom(
                    text: 'Submit',
                    onPressed: () {
                      // For now, just show a message
                      // In a real app, you would integrate with a geocoding service
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Searching for nearest station to the entered place',
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  String _getNearestStationText(HomeState state) {
    if (state is HomeNearestStationFound) {
      return state.nearestStation;
    } else if (state is HomeLoading) {
      return 'Finding nearest station...';
    } else {
      return 'Nearest Station';
    }
  }

  Color _getNearestStationColor(HomeState state) {
    if (state is HomeNearestStationFound) {
      return magentaColor;
    } else {
      return Colors.grey;
    }
  }
}
