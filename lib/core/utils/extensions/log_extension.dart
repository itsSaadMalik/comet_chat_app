import 'dart:developer' as d;

extension LogExtension on Object {
  void log() => d.log(toString());
}
