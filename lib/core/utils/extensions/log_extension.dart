import 'dart:developer' as d;

extension LogExtension on Object {
  void log({String? startText, String? endText}) =>
      d.log('${startText ?? ''} ${toString()} ${endText ?? ''}');
}
