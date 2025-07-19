import 'package:comet_chat_app/core/enums/operation_results_enums.dart';

class OperationResults {
  final OperationResultsEnums operationResultsStatus;
  final String? message;

  OperationResults({
    required this.operationResultsStatus,
    required this.message,
  });
  @override
  bool operator ==(covariant OperationResults other) =>
      operationResultsStatus == other.operationResultsStatus;

  @override
  int get hashCode => operationResultsStatus.hashCode;
}
