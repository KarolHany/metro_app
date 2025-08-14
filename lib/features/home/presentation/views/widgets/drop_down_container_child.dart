// features/home/presentation/views/widgets/drop_down_container_child.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metro_app/core/constants/app_constants.dart';
import 'package:metro_app/core/widgets/custom_buttom.dart';
import 'package:metro_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:metro_app/features/info/cubit/info_cubit.dart';
import 'package:metro_app/features/home/presentation/views/widgets/drop_down.dart';
import 'package:metro_app/features/info/presentation/views/info_view.dart';

class DropDownContainerChild extends StatefulWidget {
  const DropDownContainerChild({super.key, this.initialToStation = ''});

  final String initialToStation;

  @override
  State<DropDownContainerChild> createState() => _DropDownContainerChildState();
}

class _DropDownContainerChildState extends State<DropDownContainerChild> {
  String fromStation = '';
  String toStation = '';

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomePlaceFound) {
          setState(() {
            toStation = state.nearestStation;
          });
        } else if (state is HomeLoaded && fromStation.isEmpty) {
          setState(() {
            fromStation = state.nearestStation;
          });
        }
      },
      child: Column(
        children: [
          DropDownWidget(
            value: fromStation,
            icon: IconButton(
              onPressed: () {},
              icon: Icon(Icons.location_on, color: darkRed),
            ),
            label: 'I\'m leaving from:',
            hint: 'Type a station...',
            stations: context.read<HomeCubit>().stations,
            onChange: (value) => setState(() => fromStation = value ?? ''),
          ),
          const SizedBox(height: 20),
          DropDownWidget(
            value: toStation,
            icon: IconButton(
              onPressed: () {},
              icon: Icon(Icons.location_searching, color: darkRed),
            ),
            label: 'I\'m heading to:',
            hint: 'Type a station or place...',
            stations: context.read<HomeCubit>().stations,
            onChange: (value) => setState(() => toStation = value ?? ''),
          ),
          const SizedBox(height: 10),
          CustomButtom(
            text: 'Submit',
            onPressed: () {
              if (fromStation.isEmpty || toStation.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please select both stations')),
                );
                return;
              } else if (fromStation == toStation) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please select the different stations'),
                  ),
                );
                return;
              }
              context.read<InfoCubit>().getPathOfTrip(fromStation, toStation);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const InfoView()),
              );
            },
          ),
        ],
      ),
    );
  }
}
