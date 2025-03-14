import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vsahha/Historique/historique_medical.dart';
import 'package:vsahha/Home/favoris_doctor.dart';
import 'package:vsahha/Home/home_screen.dart';
import 'package:vsahha/Home/notification_page.dart';
import 'package:vsahha/Home/reservation_page.dart';
import 'package:vsahha/Home/smartwatch.dart';
import 'package:vsahha/MyCalendar/my_calendar.dart';
import 'package:vsahha/authentification/login_screen.dart';
import 'package:vsahha/controller/auth_controller.dart';
import 'package:vsahha/generated/l10n.dart';
import 'package:vsahha/profile/help_center.dart';
import 'package:vsahha/profile/settings_page.dart';

class DrawerScreen extends StatefulWidget {
  final int selectedIndex;

  const DrawerScreen({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  final AuthController _authController = Get.find<AuthController>();
  String name = "Loading...";
  String surname = "Loading...";
  String email = "Loading...";
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Get.put(AuthController());
    _fetchProfile();
  }

  Future<void> _fetchProfile() async {
    final result = await _authController.getPatientProfile();

    if (result['success'] == true) {
      setState(() {
        name = result['patient']['Name'] ?? S.of(context).unknown;
        surname = result['patient']['Surname'] ?? S.of(context).unknown;
        email = result['patient']['E_mail'] ?? S.of(context).unknown;
        isLoading = false;
      });
    } else {
      setState(() {
        name = "Error";
        email = result['message'] ?? "Failed to load data";
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(bottom: 5.0),
          child: UserAccountsDrawerHeader(
            accountName: Text(
              "Oussema Ben Said",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            accountEmail: Text(
              "bensaidoussema@gmail.com",
              style: const TextStyle(color: Colors.black),
            ),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage('assets/oussema.jpg'),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFF44a4a4),
                  blurRadius: 5.0,
                  offset: Offset(0, 5),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 30),

        DrawerMenuItem(
          text: 'Home',
          icon: Icons.home,
          isSelected: widget.selectedIndex == 0,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
        DrawerMenuItem(
          text: S.of(context).settings,
          icon: Icons.settings,
          isSelected: widget.selectedIndex == 4,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsPage()),
            );
          },
        ),
        DrawerMenuItem(
          text: S.of(context).mycalendar,
          icon: Icons.calendar_month_outlined,
          isSelected: widget.selectedIndex == 5,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyCalendar()),
            );
          },
        ),
        DrawerMenuItem(
          text: S.of(context).smartwatch,
          icon: Icons.watch_outlined,
          isSelected: widget.selectedIndex == 8,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SmartWatch()),
            );
          },
        ),
        DrawerMenuItem(
          text: 'Notifications',
          icon: Icons.notifications_active_outlined,
          isSelected: widget.selectedIndex == 3,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NotificationPage()),
            );
          },
        ),
        DrawerMenuItem(
          text: S.of(context).myreservations,
          icon: Icons.book_outlined,
          isSelected: widget.selectedIndex == 7,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ReservationPage()),
            );
          },
        ),
        DrawerMenuItem(
          text: S.of(context).dossierMedical,
          icon: Icons.medical_information_outlined,
          isSelected: widget.selectedIndex == 1,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HistoriqueMedical()),
            );
          },
        ),
        DrawerMenuItem(
          text: 'Favorites',
          icon: Icons.favorite,
          isSelected: widget.selectedIndex == 5,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FavorisDoctors()),
            );
          },
        ),
        DrawerMenuItem(
          text: S.of(context).helpCenter,
          icon: Icons.help_outline,
          isSelected: widget.selectedIndex == 6,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HelpCenter()),
            );
          },
        ),

        const Divider(),

        ListTile(
          leading: const Icon(Icons.logout, color: Colors.red),
          title: Text(S.of(context).logout),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
        ),
      ],
    );
  }
}

class DrawerMenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isSelected; // Add a flag to indicate if the item is selected
  final VoidCallback? onTap;

  const DrawerMenuItem({
    super.key,
    required this.icon,
    required this.text,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: isSelected ? Colors.blue : Colors.blueGrey),
      title: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.blue : Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: onTap,
    );
  }
}
