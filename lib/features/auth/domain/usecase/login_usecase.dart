// import 'package:comet_chat_app/core/enums/auth_status.dart';
// import 'package:comet_chat_app/core/enums/auth_types.dart';
// import 'package:comet_chat_app/features/auth/data/data%20src/email_auth_datasrc.dart';
// import 'package:comet_chat_app/features/auth/data/data%20src/facebook_auth_datasrc.dart';
// import 'package:comet_chat_app/features/auth/data/data%20src/google_auth_datasrc.dart';
// import 'package:comet_chat_app/features/auth/data/model/auth%20credentials/email_credentials.dart';
// import 'package:comet_chat_app/features/auth/data/model/auth_results.dart';
// import 'package:comet_chat_app/features/auth/data/repo/user_repo_impl.dart';
// import 'package:comet_chat_app/features/auth/domain/entity/auth_credentials_base.dart';
// import 'package:comet_chat_app/utils/extensions/log_extension.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class LoginUsecase {
//   final UserRepositoryImpl userRepositoryImpl;
//   final EmailAuthSource emailAuthSource;
//   final GoogleAuthsource googleAuthsource;
//   final FacebookAuthsource facebookAuthsource;

//   // this method will only be used by oAuths
//   Future<AuthResults> oAuthLogin({
//     required AuthCredentialsBase authCerdentials,
//     required AuthType authtype,
//   }) async {
//     try {
//       AuthResults authResults;
//       switch (authtype) {
//         case AuthType.email:
//           // TODO: Handle this case.
//           throw UnimplementedError();
//         case AuthType.google:
//           authResults = await googleAuthsource.signIn(
//             authCredentials: authCerdentials,
//           );

//         case AuthType.facebook:
//           authResults = await facebookAuthsource.signIn(
//             authCredentials: authCerdentials,
//           );
//       }

//       return authResults;
//     } catch (e) {
//       e.log();
//       return AuthResults(authStatus: AuthStatus.failure, message: e.toString());
//     }
//   }
// }
