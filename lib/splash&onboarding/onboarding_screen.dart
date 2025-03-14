import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:vsahha/Home/home_screen.dart';
import 'package:vsahha/controller/auth_controller.dart';
import 'package:vsahha/generated/l10n.dart';
import '../authentification/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

Future<void> _checkLoginAndNavigate() async {
  // Check if token exists in storage
  final token = await storage.read(key: 'jwt_token');

  if (token == null) {
    // No token found, navigate to the login page
    Get.offAll(LoginPage());
    return;
  }

  // Token exists, now check its validity and if the user is a patient
  final response = await AuthController().checkPatientExists();

  if (response['success'] == true) {
    // Token is valid and the user is a patient, navigate to the home screen
    Get.offAll(const HomeScreen());
  } else {
    // Token is invalid or the user is not a patient, show an error and navigate to login
    Get.snackbar(
      'Error',
      response['message'],
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
    // Clear the invalid token from storage
    await storage.delete(key: 'jwt_token');
    Get.offAll(LoginPage());
  }
}


  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      finishButtonText: S.of(context).startNow,
      onFinish: () {
        _checkLoginAndNavigate();
      },
      finishButtonStyle: const FinishButtonStyle(
        backgroundColor: Color(0xFF44a4a4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(70)),
        ),
      ),
      skipTextButton:  Text(
        S.of(context).skip,
        style: const TextStyle(
          fontSize: 20,
          color: Color(0xFF44a4a4),
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing:  Text(
        S.of(context).go,
        style: const TextStyle(
          fontSize: 20,
          color: Color(0xFF44a4a4),
          fontWeight: FontWeight.w600,
        ),
      ),
      trailingFunction: () {
        _checkLoginAndNavigate();
      },
      controllerColor: const Color(0xFF44a4a4),
      totalPage: 3,
      headerBackgroundColor: Colors.white30,
      pageBackgroundColor: Colors.white30,

      background: [
        Container(),
        Container(),
        Container(),
      ],
      speed: 1.8,

      pageBodies: [
        _buildPageBody(
          context,
          title: S.of(context).welcome,
          description: S.of(context).onboarding,
          imagePath: 'assets/lg.png',
        ),
        _buildPageBody(
          context,
          title: S.of(context).onboardingg,
          description: S.of(context).onboard,
          imagePath: 'assets/doctor2.png',
        ),
        _buildPageBody(
          context,
          title: S.of(context).startNow,
          description: S.of(context).started,
          imagePath: 'assets/doctor.png',
        ),
      ],
    );
  }

  Widget _buildPageBody(BuildContext context,
      {required String title,
      required String description,
      required String imagePath}) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            imagePath,
            height: MediaQuery.of(context).size.height * 0.3,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 40),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF44a4a4),
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black26,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
