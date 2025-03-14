import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vsahha/controller/auth_controller.dart';

// Assuming the checkPatientExists method is inside an AuthController

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // Call the checkPatientExists function from your controller
    final authController = Get.find<AuthController>(); // Use GetX to find the controller
    authController.checkPatientExists().then((result) {
      if (result['success'] == false) {
        // If patient does not exist, redirect to login page
        Get.offAllNamed('/login');
      }
    });

    // Return null so it doesn't block navigation to the route
    return null;
  }
}
