import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metro_app/core/constants/app_constants.dart';
import 'package:metro_app/core/helpers/text_styles.dart';
import 'package:metro_app/core/widgets/custom_buttom.dart';
import 'package:metro_app/core/widgets/custom_container.dart';
import 'package:metro_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:metro_app/features/home/presentation/views/widgets/drop_down_container_child.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeViewBody extends StatelessWidget {
  HomeViewBody({super.key});

  final TextEditingController placeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocListener<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is HomeError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: SafeArea(
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
                  child:
                      const DropDownContainerChild(), // Removed BlocBuilder from here
                ),
                const SizedBox(height: 40),
                Text(
                  'The Nearest Station to Your Current Location',
                  style: Styles.textStyle18.copyWith(color: magentaColor),
                ),
                const SizedBox(height: 15),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return CustomContainer(
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
                                state is HomeLoaded
                                    ? state.nearestStation
                                    : 'Nearest Station',
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  context.read<HomeCubit>().getNearestStation();
                                },
                                icon: Icon(Icons.location_on, color: neonColor),
                              ),
                              IconButton(
                                onPressed: state is HomeLoaded
                                    ? () async {
                                        final uri = Uri.parse(
                                            'https://www.google.com/maps/dir/?api=1&destination='
                                            '${state.lat},${state.lng}&travelmode=walking');
                                        final ok = await launchUrl(
                                          uri,
                                          mode: LaunchMode.externalApplication,
                                        );
                                        if (!ok) {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(content: Text('Could not open Maps')),
                                          );
                                        }
                                      }
                                    : null,
                                icon: const Icon(Icons.map),
                                color: magentaColor,
                                tooltip: 'Route to nearest station',
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
                // In the text field section of your HomeViewBody:
                const SizedBox(height: 20),
                Text(
                  'Find Nearest Station to Any Place',
                  style: Styles.textStyle18.copyWith(color: magentaColor),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: placeController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter any place in Cairo',
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
                const SizedBox(height: 10),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return CustomButtom(
                      text: 'Submit',
                      onPressed: () {
                        if (placeController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please enter a place name'),
                            ),
                          );
                          return;
                        }
                        context.read<HomeCubit>().findNearestStationFromPlace(
                          placeController.text,
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
    
  }
}
