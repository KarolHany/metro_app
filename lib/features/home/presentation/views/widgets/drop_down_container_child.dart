import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metro_app/core/widgets/custom_buttom.dart';
import 'package:metro_app/features/home/presentation/cubit/info_cubit.dart';
import 'package:metro_app/features/home/presentation/views/widgets/drop_down.dart';
import 'package:metro_app/features/info/presentation/views/info_view.dart';

// ignore: must_be_immutable
class DropDownContainerChild extends StatelessWidget {
  DropDownContainerChild({super.key});

  String fromStation = '';
  String toStation = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropDownWidget(
          icon: Icons.location_on,
          label: 'I\'m leaving from:',
          hint: 'Type a station...',
          onChange: (value) {
            fromStation = value!;
          },
        ),
        const SizedBox(height: 20),
        DropDownWidget(
          icon: Icons.location_searching,
          label: 'I\'m heading to:',
          hint: 'Type a station...',
          onChange: (value) {
            toStation = value!;
          },
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
            }
            
            context.read<InfoCubit>().getPathOfTrip(fromStation, toStation);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const InfoView()),
            );
          },
        ),
      ],
    );
  }
}