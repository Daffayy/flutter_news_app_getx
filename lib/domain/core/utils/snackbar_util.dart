import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SnackbarUtil {
  static showSuccess({required String message}) {
    Get.rawSnackbar(
      title: 'Success',
      icon: const Icon(Icons.thumb_up, color: Colors.white),
      message: message,
      backgroundColor: Colors.green.shade600,
    );
  }

  static showWarning({required String message}) {
    Get.rawSnackbar(
      duration: const Duration(seconds: 5),
      title: 'Warning',
      icon: const Icon(Icons.warning, color: Colors.white),
      message: message,
      backgroundColor: Colors.orange.shade900,
    );
  }

  static showError({required String message}) {
    Get.rawSnackbar(
      title: 'Error',
      icon: const Icon(Icons.error, color: Colors.white),
      message: message,
      backgroundColor: Colors.redAccent.shade700,
    );
  }
}