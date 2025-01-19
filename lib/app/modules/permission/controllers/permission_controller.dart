// ignore_for_file: unnecessary_overrides

import 'dart:io';

import 'package:customer/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:customer/constant_widgets/show_toast_dialog.dart';
import 'package:location/location.dart';

class PermissionController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  updatePermissions() async {
    Location location = Location();
    PermissionStatus permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.granted) {
      if (Platform.isAndroid) {
        location.isBackgroundModeEnabled().then((value) {
          if (value) {
            Get.toNamed(Routes.HOME);
          } else {
            ShowToastDialog.showToast("Please enable background mode");
          }
        });
      } else {
        Get.toNamed(Routes.HOME);
      }
    } else {
      location.requestPermission().then((permissionStatus) {
        if (permissionStatus == PermissionStatus.granted) {
          if (Platform.isAndroid) {
            location.enableBackgroundMode(enable: true).then((value) {
              if (value) {
                Get.toNamed(Routes.HOME);
              } else {
                ShowToastDialog.showToast("Please enable background mode");
              }
            });
          } else {
            Get.toNamed(Routes.HOME);
          }
        }
      });
    }
    update();
  }
}
