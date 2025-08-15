import 'dart:convert';

import 'package:marketi/core/services/shared_prefs.dart';
import 'package:marketi/core/utils/storage_key.dart';
import 'package:marketi/features/auth/data/models/user_data/user.dart';

User getUser() {
  var jsonString = CacheHelper().getDataString(key: StorageKey.userData);
  var user = User.fromJson(jsonDecode(jsonString ?? ""));
  return user;
}
