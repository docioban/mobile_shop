import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/app_colors.dart';

class NetworkCheck {
  checkNetwork({required void Function() function}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
    } else {
      if (!Get.isSnackbarOpen) {
        Get.showSnackbar(GetSnackBar(
          messageText: const Text(
              "Connect your device to internet and reload app or click reload button"),
          backgroundColor: AppColors.greyTextColor,
          titleText: const Text(
            "Need network connection!",
            style: TextStyle(
                color: AppColors.greenTextColor,
                fontWeight: FontWeight.w700,
                fontSize: 16),
          ),
          mainButton: GestureDetector(
              onTap: () {
                function;
                Get.closeCurrentSnackbar();
              },
              child: const Icon(Icons.replay_outlined)),
        ));
      }
    }
  }
}

// Get.showSnackbar(GetSnackBar(
//                   messageText: const Text("Connect your device to internet and reload app or click reload button"),
//                   backgroundColor: AppColors.greyTextColor,
//                   titleText: const Text(
//                     "Need network connection!",
//                     style: TextStyle(
//                         color: AppColors.greenTextColor,
//                         fontWeight: FontWeight.w700,
//                         fontSize: 16),
//                   ),
//                   mainButton:  GestureDetector(onTap: () => print("sdf"), child: const Icon(Icons.replay_outlined)),
//                 ));
//               },