import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vsahha/Home/home_screen.dart';
import 'package:vsahha/profile/edit_page.dart';
import 'package:vsahha/profile/help_center.dart';
import '../controller/language_controller.dart';
import '../generated/l10n.dart';
import '../utils/custom_navigation_bar.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int selectedIndex = 3;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

        @override
  void initState() {
    super.initState();
   // _checkPatientExists();
  }

   /* void _checkPatientExists() async {
    final authController = Get.find<AuthController>();
    final result = await authController.checkPatientExists();
    if (result['success'] == false) {
      Get.offAllNamed('/login');
    }
  }*/

  double xOffset = 0;
  double yOffset = 0;
  bool isDrawerOpen = false;
  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              _buildProfileHeader(),
              const SizedBox(height: 40),
              _buildSettingsOptions(),
              const SizedBox(height: 20),
              _buildLogoutButton(),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Material(
        shape: const CircleBorder(),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: const [
              BoxShadow(
                color: Color(0xFF44a4a4),
                blurRadius: 30.0,
                offset: Offset(10, 10),
              ),
            ],
          ),
          child: FloatingActionButton(
            shape: const CircleBorder(),
            onPressed: () {},
            child: Icon(Icons.calendar_month_outlined),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: selectedIndex),
    );
  }

  Widget _buildProfileHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFF44a4a4),
              blurRadius: 5.0,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("assets/oussema.jpg"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.white,
                      BlendMode.darken,
                    ),
                  ),
                ),
              ),
            ),
            const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Oussema ben said",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                    ),
                  ),
                  Text(
                    "bensaidoussema.com",
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsOptions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Container(
        height: 250,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFF44a4a4),
              blurRadius: 5.0,
              offset: Offset(0, 5),
            ),
          ],
        ),

        child: Column(
          children: [
            _buildOptionEdit(),
            _divider(),
            _buildOptionLanguage(),
            _divider(),
            _buildOptionHelpCenter(),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionEdit() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap:
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EditPage()),
              ),
          child: Row(
            children: [
              const SizedBox(width: 5),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Image.asset(
                    "assets/edite.png",
                    height: 30,
                    width: 30.w,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  S.of(context).editInfo,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFF1FADB6),
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionLanguage() {
    String currentLanguage = Get.find<LanguageController>().currentLanguage;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: Image.asset(
                          'assets/en.jpg',
                          width: 30,
                          height: 20,
                        ),
                        title: const Text("English"),
                        tileColor:
                            currentLanguage == 'en' ? Colors.grey[300] : null,
                        onTap: () {
                          if (currentLanguage == 'en') {
                            CherryToast.info(
                              title: const Text(
                                "You have already selected English",
                              ),
                              animationType: AnimationType.fromTop,
                            ).show(context);
                          } else {
                            Get.find<LanguageController>().changeLanguage('en');
                            Navigator.pop(context);
                            CherryToast.success(
                              title: const Text("Language changed"),
                              displayIcon: true,
                              animationType: AnimationType.fromLeft,
                            ).show(context);
                          }
                        },
                      ),
                      ListTile(
                        leading: Image.asset(
                          'assets/fr.jpeg',
                          width: 30,
                          height: 20,
                        ),
                        title: const Text("Français"),
                        tileColor:
                            currentLanguage == 'fr' ? Colors.grey[300] : null,
                        onTap: () {
                          if (currentLanguage == 'fr') {
                            CherryToast.info(
                              title: const Text(
                                "Vous avez déjà sélectionné le Français",
                              ),
                              description: const Text(
                                "Aucun changement effectué.",
                              ),
                              animationType: AnimationType.fromTop,
                            ).show(context);
                          } else {
                            Get.find<LanguageController>().changeLanguage('fr');
                            Navigator.pop(context);
                            CherryToast.success(
                              title: const Text("Langue changée"),
                              displayIcon: true,
                              animationType: AnimationType.fromLeft,
                            ).show(context);
                          }
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: Row(
            children: [
              const SizedBox(width: 5),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Image.asset(
                    "assets/internet.png",
                    height: 30,
                    width: 30,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  S.of(context).changeLanguage,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFF1FADB6),
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionHelpCenter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap:
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HelpCenter()),
              ),
          child: Row(
            children: [
              const SizedBox(width: 5),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Image.asset(
                    "assets/support.png",
                    height: 30,
                    width: 30.w,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  S.of(context).helpCenter,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFF1FADB6),
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionRating() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap:
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              ),
          child: Row(
            children: [
              const SizedBox(width: 5),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Image.asset("assets/star.png", height: 30, width: 30),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  S.of(context).ratings,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFF1FADB6),
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOption(String title, String asset, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: const Color(0xFFF2F2F2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: Image.asset(asset, height: 30, width: 30.w)),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title.trim(),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFF1FADB6),
              size: 18,
            ),
          ],
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(height: 1.7, width: 293.w, color: const Color(0xFFF2F2F2));
  }

  Widget _buildLogoutButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFF44a4a4),
              blurRadius: 5.0,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: InkWell(
          onTap: () async {},
          child: Row(
            children: [
              const SizedBox(width: 5),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.logout, color: Color(0xFF1FADB6)),
              ),
              const SizedBox(width: 20),
              Text(
                S.of(context).logout.trim(),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
