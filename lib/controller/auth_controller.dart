import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthController {
  final String baseUrl = "http://192.168.1.8:8000/api";
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  // Existing Login Method
  Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/patient/login');
    final headers = {"Content-Type": "application/json"};
    final body = json.encode({
      "email": email,
      "password": password,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 'success') {
          await storage.write(key: 'jwt_token', value: data['token']);
          return {"success": true, "patient": data['patient']};
        } else {
          return {"success": false, "message": data['message']};
        }
      } else {
        final error = json.decode(response.body);
        return {"success": false, "message": error['message'] ?? 'An error occurred.'};
      }
    } catch (e) {
      return {"success": false, "message": "Connection error. Please try again."};
    }
  }

  // 1. Send OTP for Forgot Password
  Future<Map<String, dynamic>> sendForgotPasswordOtp(String email) async {
    final url = Uri.parse('$baseUrl/patient/forgot-password');
    final headers = {"Content-Type": "application/json"};
    final body = json.encode({"email": email});

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 'success') {
          return {"success": true, "message": data['message']};
        } else {
          return {"success": false, "message": data['message']};
        }
      } else {
        final error = json.decode(response.body);
        return {"success": false, "message": error['message'] ?? "An error occurred."};
      }
    } catch (e) {
      return {"success": false, "message": "Connection error. Please try again."};
    }
  }

  // 2. Verify OTP and Reset Password
  Future<Map<String, dynamic>> verifyOtpAndResetPassword(
      String email, String otp, String newPassword, String confirmPassword) async {
    final url = Uri.parse('$baseUrl/patient/verify-otp');
    final headers = {"Content-Type": "application/json"};
    final body = json.encode({
      "email": email,
      "otp": otp,
      "new_password": newPassword,
      "new_password_confirmation": confirmPassword,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 'success') {
          return {"success": true, "message": data['message']};
        } else {
          return {"success": false, "message": data['message']};
        }
      } else {
        final error = json.decode(response.body);
        return {"success": false, "message": error['message'] ?? "An error occurred."};
      }
    } catch (e) {
      return {"success": false, "message": "Connection error. Please try again."};
    }
  }

  // Fetch Patient Profile
Future<Map<String, dynamic>> getPatientProfile() async {
  final url = Uri.parse('$baseUrl/patient/profile');
  final token = await storage.read(key: 'jwt_token');

  if (token == null) {
    return {"success": false, "message": "Token is missing. Please log in again."};
  }

  final headers = {
    "Content-Type": "application/json",
    "Authorization": "Bearer $token",
  };

  try {
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == 'success') {
        return {
          "success": true,
          "user": data['data']['user'],
          "patient": data['data']['patient'],
        };
      } else {
        return {"success": false, "message": data['message']};
      }
    } else if (response.statusCode == 403) {
      final error = json.decode(response.body);
      return {"success": false, "message": error['message'] ?? "Access denied."};
    } else {
      final error = json.decode(response.body);
      return {"success": false, "message": error['message'] ?? "An error occurred."};
    }
  } catch (e) {
    return {"success": false, "message": "Connection error. Please try again."};
  }
}

Future<Map<String, dynamic>> checkPatientExists() async {
  final url = Uri.parse('$baseUrl/check-patient-exists'); 
  final token = await storage.read(key: 'jwt_token'); 

  if (token == null) {
    return {
      "success": false,
      "message": "Token is missing. Please log in again."
    };
  }

  final headers = {
    "Content-Type": "application/json",
    "Authorization": "Bearer $token", 
  };

  try {
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == 'success') {
        return {
          "success": true,
          "message": data['message'],
          "data": data['data'], // Include patient details
        };
      } else {
        return {
          "success": false,
          "message": data['message'],
        };
      }
    } else if (response.statusCode == 401) {
      return {
        "success": false,
        "message": "Authentication error. Please log in again."
      };
    } else if (response.statusCode == 403) {
      return {
        "success": false,
        "message": "Access denied. Only patients are allowed."
      };
    } else {
      final error = json.decode(response.body);
      return {
        "success": false,
        "message": error['message'] ?? "An unknown error occurred."
      };
    }
  } catch (e) {
    return {
      "success": false,
      "message": "Connection error. Please try again."
    };
  }
}


}
