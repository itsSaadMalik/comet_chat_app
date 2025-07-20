import 'package:comet_chat_app/core/enums/auth_status.dart';
import 'package:comet_chat_app/features/auth/data/data%20src/email_auth_datasrc.dart';
import 'package:comet_chat_app/features/auth/data/model/auth%20credentials/email_credentials.dart';
import 'package:comet_chat_app/features/auth/data/model/auth_results.dart';
import 'package:comet_chat_app/features/auth/data/model/user_model.dart';
import 'package:comet_chat_app/features/auth/domain/entity/auth_credentials_base.dart';
import 'package:comet_chat_app/features/auth/domain/entity/login_usecase_strategy.dart';
import 'package:comet_chat_app/utils/extensions/log_extension.dart';

class EmailLoginUsecase implements LoginUsecaseStrategy {
  final EmailAuthSource emailAuthSource;

  EmailLoginUsecase({required this.emailAuthSource});
  @override
  Future<AuthResults> cacheUserLocally({required UserModel user}) {
    // TODO: implement cacheUserLocally
    throw UnimplementedError();
  }

  @override
  Future<AuthResults> fetchUser({required String uid}) {
    // TODO: implement fetchUser
    throw UnimplementedError();
  }

  @override
  Future<AuthResults> login({
    required AuthCredentialsBase authCredentials,
  }) async {
    try {
      final creds = authCredentials as EmailCredentials;
      final authResults = await emailAuthSource.signIn(
        authCredentials: EmailCredentials(email: creds.email, pass: creds.pass),
      );

      return authResults;
    } catch (e) {
      e.log();
      return AuthResults(authStatus: AuthStatus.failure, message: e.toString());
    }
  }
}
