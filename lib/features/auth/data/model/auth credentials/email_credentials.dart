import 'package:comet_chat_app/features/auth/domain/entity/auth_credentials_base.dart';

class EmailCredentials implements AuthCredentialsBase {
  final String email;
  final String pass;

  EmailCredentials({required this.email, required this.pass});
  @override
  bool operator ==(covariant EmailCredentials other) => email == other.email;

  @override
  int get hashCode => email.hashCode;
}
