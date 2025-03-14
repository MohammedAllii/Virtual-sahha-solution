import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vsahha/Historique/diseases.dart';
import 'package:vsahha/Historique/examens_medicaux.dart';
import 'package:vsahha/Historique/operations_chirurgicales.dart';
import 'package:vsahha/Historique/pharmaceutique.dart';
import 'package:vsahha/MyCalendar/my_calendar.dart';
import '../generated/l10n.dart';
import '../utils/custom_navigation_bar.dart';

class HistoriqueMedical extends StatefulWidget {
  const HistoriqueMedical({Key? key}) : super(key: key);

  @override
  _HistoriqueMedicalState createState() => _HistoriqueMedicalState();
}

int selectedIndex = 1;

class _HistoriqueMedicalState extends State<HistoriqueMedical> {
  
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
  return Scaffold(    
appBar: AppBar(
),
    body: SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              _buildTitle(),
              SizedBox(height: 40.h),
              _buildSettingsOptions(),
              SizedBox(height: 40.h),
            ],
          ),
        ),
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

  Widget _buildTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17),
      child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 15,
                      ),
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
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.medical_information_rounded,
                color: Colors.black,
                size: 30,
              ),
            ),
            const SizedBox(width: 15),
             Text(
              S.of(context).dossierMedical,
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                letterSpacing: 0.5,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsOptions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17.0),
      child: Container(
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
            _buildOptionExamensMedicaux(),
            _divider(),
            _buildOptionOperationschirurgicales(),
            _divider(),
            _buildOptionPharmaceutique(),
            _divider(),
            _buildOptionMaladies(),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionMaladies() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
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
                MaterialPageRoute(builder: (context) =>  Diseases()),
              ),
          child: Row(
            children: [
              SizedBox(width: 5.w),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Image.asset("assets/Diseases.png",color: Color(0xFF44a4a4), height: 30, width: 30),
                ),
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: Text(
                  S.of(context).maladies,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFF1FADB6),
                size: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionPharmaceutique() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
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
                MaterialPageRoute(builder: (context) =>  Pharmaceutique()),
              ),
          child: Row(
            children: [
              SizedBox(width: 5.w),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Image.asset("assets/pharmaceutique.png",color: Color(0xFF44a4a4), height: 30, width: 30),
                ),
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: Text(
                  S.of(context).pharmaceutique,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFF1FADB6),
                size: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionExamensMedicaux() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
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
                MaterialPageRoute(builder: (context) => const MedicalTest()),
              ),
          child: Row(
            children: [
              SizedBox(width: 5.w),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Image.asset("assets/examens.png",color: Color(0xFF44a4a4), height: 30, width: 30),
                ),
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: Text(
                  S.of(context).ExamensMedicaux,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFF1FADB6),
                size: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionOperationschirurgicales() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
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
                MaterialPageRoute(builder: (context) =>  OperationsChirurgicales()),
              ),
          child: Row(
            children: [
              SizedBox(width: 5.w),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Image.asset(
                    "assets/operations.png",
                    height: 30,
                    width: 30,
                    color: Color(0xFF44a4a4),
                  ),
                ),
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: Text(
                  S.of(context).Operationschirurgicales,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFF1FADB6),
                size: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(height: 1.7, width: 293.w, color: const Color(0xFFF2F2F2));
  }
}
