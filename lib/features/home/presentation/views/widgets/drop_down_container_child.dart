import 'package:flutter/material.dart';
import 'package:metro_app/core/widgets/custom_buttom.dart';
import 'package:metro_app/features/home/presentation/views/widgets/drop_down.dart';
import 'package:metro_app/features/info/presentation/views/info_view.dart';

class DropDownContainerChild extends StatelessWidget {
  const DropDownContainerChild({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //? From Station Dropdown
        DropDownWidget(
          icon: Icons.location_on,
          label: 'I\'m leaving from:',
          hint: 'Type a station...',
          onChange: (value) {},
        ),
        const SizedBox(height: 20),
        //? To Station Dropdown
        DropDownWidget(
          icon: Icons.location_searching,
          label: 'I\'m heading to:',
          hint: 'Type a station...',
          onChange: (value) {},
        ),
        const SizedBox(height: 10),
        CustomButtom(
          text: 'Submit',
          onPressed: () {
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
