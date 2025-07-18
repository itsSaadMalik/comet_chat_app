import 'package:comet_chat_app/features/auth/data/data%20src/google_auth_datasrc.dart';
import 'package:comet_chat_app/features/auth/data/model/auth_results.dart';
import 'package:comet_chat_app/features/auth/domain/entity/auth_credentials_base.dart';
import 'package:comet_chat_app/features/auth/domain/entity/auth_startegy.dart';

class GoogleAuthStrategy implements AuthStartegy {
  final GoogleAuthsource googleAuthsource;

  GoogleAuthStrategy({required this.googleAuthsource});
  @override
  Future<AuthResults> signIn({
    required AuthCredentialsBase authCredentials,
  }) async => googleAuthsource.signIn(authCredentials: authCredentials);

  @override
  Future<AuthResults> signOut() async => googleAuthsource.signOut();

  @override
  Future<AuthResults> deleteAccount() async => googleAuthsource.deleteAccount();

  @override
  Future<AuthResults> signUp({
    required AuthCredentialsBase authCredentials,
  }) async => googleAuthsource.signIn(authCredentials: authCredentials);
}
