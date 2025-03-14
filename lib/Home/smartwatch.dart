import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vsahha/MyCalendar/my_calendar.dart';
import '../utils/custom_navigation_bar.dart' show CustomBottomNavBar;

class SmartWatch extends StatefulWidget {
  const SmartWatch({super.key});

  @override
  State<SmartWatch> createState() => _SmartWatchState();
}

class _SmartWatchState extends State<SmartWatch> {
  int selectedIndex = 8;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    final double cardWidth = MediaQuery.of(context).size.width * 0.45;
    final double height = MediaQuery.of(context).size.height * 0.25;

    Widget buildCard({
      required String title,
      required String imagePath,
      required String value,
      required String unit,
      Color bgColor = Colors.white,
      Color textColor = Colors.black,
    }) {
      return Container(
        width: cardWidth,
        height: height,
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
                      BoxShadow(
                        color: Color(0xFF44a4a4),
                        blurRadius: 5.0,
                        offset: Offset(0, 5),
                      ),
                    ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.roboto(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600,
                      color: textColor,
                    ),
                  ),
                  Image.asset(imagePath, height: 40, width: 40),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                value,
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              Text(unit, style: TextStyle(fontSize: 15.sp, color: textColor)),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF44a4a4),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Container(
  width: double.infinity,
  padding: EdgeInsets.only(
    left: 20.w,
    right: 20.w,
    bottom: 20.h,
  ),
  decoration: const BoxDecoration(
    color: Color(0xFF44a4a4),
    borderRadius: BorderRadius.vertical(
      bottom: Radius.circular(30),
    ),
  ),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Row(
        children: [
          Expanded(
            child: Text(
              "Track your health by connecting HealthKit.",
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 22.sp,
              ),
            ),
          ),
          Image.asset(
            "assets/smart-watch.png",
            height: 120.h,
            width: 90.w,
          ),
        ],
      ),
      const SizedBox(height: 5), 
      ElevatedButton.icon(
        onPressed: null, 
        icon: const Icon(Icons.bluetooth,color: Colors.white,),
        label: const Text("Connect to SmartWatch",style: TextStyle(color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
      ),
    ],
  ),
),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: buildCard(
                          title: "Walk",
                          imagePath: "assets/shoe.png",
                          value: "0",
                          unit: "steps",
                          bgColor: const Color(0xFF44a4a4),
                          textColor: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 10), // Espace entre les cartes
                      Expanded(
                        child: buildCard(
                          title: "Gym",
                          imagePath: "assets/clock.png",
                          value: "0",
                          unit: "min",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10), // Espace entre les lignes
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: buildCard(
                          title: "Heart",
                          imagePath: "assets/cardiology (1).png",
                          value: "0",
                          unit: "score",
                        ),
                      ),
                      const SizedBox(width: 10), // Espace entre les cartes
                      Expanded(
                        child: buildCard(
                          title: "Sleep",
                          imagePath: "assets/sleeping-time.png",
                          value: "0",
                          unit: "hours",
                          bgColor: const Color(0xFF44a4a4),
                          textColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10), // Espace entre les lignes
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: buildCard(
                          title: "Oxygen",
                          imagePath: "assets/oxygen.png",
                          value: "0",
                          unit: "SpO₂",
                          bgColor: const Color(0xFF44a4a4),
                          textColor: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 10), // Espace entre les cartes
                      Expanded(
                        child: buildCard(
                          title: "Body ",
                          imagePath: "assets/temperature.png",
                          value: "0",
                          unit: "°C",
                        ),
                      ),
                    ],
                    
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Calendar FAB
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Material(
        shape: const CircleBorder(),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Color(0xFF44a4a4),
                blurRadius: 30.0,
                offset: Offset(10, 10),
              ),
            ],
          ),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyCalendar()),
              );
            },
            shape: const CircleBorder(),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            child: const Icon(Icons.calendar_month_outlined),
          ),
        ),
      ),

      // Bottom Nav
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: selectedIndex),
    );
  }
}
