import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vsahha/MyCalendar/my_calendar.dart';
import 'package:vsahha/generated/l10n.dart';
import 'package:vsahha/profile/about/about_consultations.dart';
import 'package:vsahha/profile/about/about_doctors.dart';
import 'package:vsahha/profile/about/about_prescriptions.dart';
import 'package:vsahha/profile/about/about_privacy.dart';
import 'package:vsahha/profile/about/about_vss.dart';
import 'package:vsahha/utils/custom_navigation_bar.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({super.key});
  

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}
  int selectedIndex = 6;

  
  


class _HelpCenterState extends State<HelpCenter> {

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
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
            backgroundColor: Colors.white,
          ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.help_outline_rounded,
                    size: 32.sp,
                    color: Color(0xFF1FADB6),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    "Frequently Asked Questions",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20.w,
                mainAxisSpacing: 20.h,
                childAspectRatio: 1.0,
              ),
              itemCount: _items(context).length,
              itemBuilder: (context, index) {
              final item = _items(context)[index];

                return InkWell(
                  onTap:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => item['route']),
                      ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13.r),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xFF44a4a4),
                          blurRadius: 5.0,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          item['icon'],
                          height: 60.h,
                          width: 60.w,
                          color: Color(0xFF44a4a4),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          item['title'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyCalendar()),
                  );
                },
                child: Icon(Icons.calendar_month_outlined),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
            ),
          ),
          bottomNavigationBar: CustomBottomNavBar(selectedIndex: selectedIndex),
    );
  }

  List<Map<String, dynamic>> _items(BuildContext context) {
  return [
    {
      'title': S.of(context).aboutprivacy,
      'icon': 'assets/hide-1.png',
      'route': AboutPrivacy(),
    },
    {
      'title': S.of(context).aboutvss,
      'icon': 'assets/lg.png',
      'route': AboutVSS(),
    },
    {
      'title': S.of(context).aboutconsultations,
      'icon': 'assets/support.png',
      'route': AboutConsultations(),
    },
    {
      'title': S.of(context).aboutprescriptions,
      'icon': 'assets/notes.png',
      'route': AboutPrescriptions(),
    },
    {
      'title': S.of(context).aboutdoctors,
      'icon': 'assets/stethoscope-7-1.png',
      'route': AboutDoctors(),
    },
  ];
}

}
