import 'package:flutter/material.dart';
import 'package:metro_app/core/helpers/text_styles.dart';
import 'package:metro_app/features/home/data/models/pair.dart';

class RouteDetails extends StatelessWidget {
  const RouteDetails({super.key, required this.pathOfRoute});
  final List<Pair<String, String>> pathOfRoute;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
                    // physics: const NeverScrollableScrollPhysics(),
                    itemCount: pathOfRoute.length,
                    itemBuilder: (context, index) {
                      final station = pathOfRoute[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              station.first,
                              style: Styles.textStyle20,
                            ),
                            
                          ],
                        ),
                      );
                    },
                  ),
        ),
      ],
    );
  }
}