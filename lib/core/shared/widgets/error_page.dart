import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          Icon(Icons.cloud_off_outlined),
          Text('something went wrong'),
        ],
      ),
    );
  }
}
