import 'package:comet_chat_app/core/enums/user_model_enums.dart';
import 'package:comet_chat_app/core/helpers/fieldnames/user_model_fieldnames.dart';
import 'package:comet_chat_app/core/utils/extensions/log_extension.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserExistenceService {
  final Supabase supabaseDatabase;

  UserExistenceService({required this.supabaseDatabase});
  Future<bool> userExists({required String uid}) async {
    try {
      final userData = await supabaseDatabase.client
          .from('users')
          .select()
          .eq(UserModelEnums.uid.fieldname, uid)
          .maybeSingle();
      return userData != null;
    } catch (e) {
      'error in reading database $e'.log();
      return false;
    }
  }
}
