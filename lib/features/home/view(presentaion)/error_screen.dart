import 'package:comet_chat_app/core/utils/extensions/log_extension.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, this.error, this.stackTrace});
  final Error? error;
  final StackTrace? stackTrace;

  @override
  Widget build(BuildContext context) {
    error?.log();
    return Scaffold(
      body: Row(
        children: [
          Image.asset('assets/icon/cloud-warning.png'),
          const Text('something went wrong'),
        ],
      ),
    );
  }
}
