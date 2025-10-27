import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Data/utils/app_constants.dart';
import '../../Routes/routes.dart';
import '../../helpers/prefs_helpers.dart';

void showLogoutBottomSheet() {
  Get.bottomSheet(
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ছোট উপরের drag bar
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 15),

          // 🔴 Logout Title
          const Text(
            "Logout",
            style: TextStyle(
              color: Colors.red,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),

          // Description Text
          const Text(
            "Are you sure you want to log out?",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 25),

          // 🔘 Buttons Row
          Row(
            children: [
              // Yes, Logout Button
              Expanded(
                child: OutlinedButton(
                  onPressed: () async {
                    await PrefsHelper.remove(AppConstants.bearerToken);
                    Get.offAllNamed(Routes.loginScreen);
                    Get.snackbar("Logged out", "You have been logged out!");
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.deepPurple),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
                  ),
                  child: const Text(
                    "Yes, Logout",
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),

              // Cancel Button
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Get.back(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
                  ),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
