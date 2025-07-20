import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // alignment: Alignment.center,
      children: [
        // VerticalDivider(),
        Expanded(
          child: Container(
            height: 1,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 177, 169, 169),
                  const Color.fromARGB(255, 83, 82, 82),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
        ),
        Text('or'),

        Expanded(
          child: Container(
            height: 1,
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 83, 82, 82),
                  const Color.fromARGB(255, 177, 169, 169),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
