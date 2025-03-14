import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:vsahha/Home/home_screen.dart';
import 'package:vsahha/Middlewares/AuthMiddleware.dart';
import 'package:vsahha/authentification/forgot_password_screen.dart';
import 'package:vsahha/authentification/login_screen.dart';
import 'package:vsahha/controller/auth_controller.dart';
import 'package:vsahha/splash&onboarding/splash_screen.dart';
import 'package:vsahha/splash&onboarding/onboarding_screen.dart';
import 'package:vsahha/utils/connection_status_widget.dart';
import 'package:vsahha/controller/language_controller.dart';
import 'package:vsahha/generated/l10n.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('fr_FR', null);

  // Initialisation des services avant le lancement de l'UI
  Get.put(LanguageController());
  Get.put(AuthController());

  runApp(const MyApp()); // Démarrage rapide
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) => GetMaterialApp(
        title: 'Vsahha',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        locale: Get.locale ?? const Locale('en'),
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        initialRoute: '/splash',
        getPages: [
          GetPage(name: '/splash', page: () => const PageSplashScreen()), 
          GetPage(name: '/onboarding', page: () => const OnboardingScreen(), middlewares: [AuthMiddleware()]),
          GetPage(name: '/login', page: () => LoginPage()),
          GetPage(name: '/forgot', page: () => ForgotPasswordPage(), middlewares: [AuthMiddleware()]),
          GetPage(name: '/home', page: () => HomeScreen(), middlewares: [AuthMiddleware()]),
        ],
        builder: (context, child) => Stack(
          children: [
            if (child != null) child,
            ConnectionStatusWidget(),
          ],
        ),
      ),
    );
  }
}
