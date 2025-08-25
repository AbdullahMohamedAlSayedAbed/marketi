import 'package:flutter/material.dart';
import 'package:marketi/core/extension/navigate_extension.dart';
import 'package:marketi/core/services/shared_prefs.dart';
import 'package:marketi/core/utils/on_generate_router.dart';
import 'package:marketi/core/utils/storage_key.dart';
import 'package:marketi/core/widgets/custom_primary_button.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: const Text(
        "Log Out",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: const Text(
        "Are you sure you want to log out?",
        style: TextStyle(fontSize: 14),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context); // إلغاء
          },
          child: const Text("Cancel", style: TextStyle(color: Colors.grey)),
        ),
        CustomPrimaryButton(
          text: "Log Out",
          onPressed: () {
            CacheHelper().removeData(key: StorageKey.userToken);
            context.pushNamedAndRemoveUntil(AppRouter.login);
          },
        ),
      ],
    );
  }
}
