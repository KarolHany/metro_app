import 'package:flutter/material.dart';
import 'package:metro_app/core/helpers/text_styles.dart';

class RouteDetails extends StatelessWidget {
  const RouteDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 30,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Text(
                  '•',
                  style: Styles.textStyle30.copyWith(
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 2,
                    color: Colors.white,
                    margin: const EdgeInsets.symmetric(vertical: 4),
                  ),
                ),
                Text(
                  '•',
                  style: Styles.textStyle30.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
    
          Expanded(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Text('Helwan', style: Styles.textStyle20),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}