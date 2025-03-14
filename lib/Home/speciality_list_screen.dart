import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vsahha/Home/doctors_list.dart';
import 'package:vsahha/MyCalendar/my_calendar.dart';
import 'package:vsahha/controller/auth_controller.dart';
import 'package:vsahha/generated/l10n.dart';
import 'package:vsahha/utils/custom_navigation_bar.dart';

class SpecialityListScreen extends StatefulWidget {
  const SpecialityListScreen({super.key});

  @override
  State<SpecialityListScreen> createState() => _SpecialityListScreenState();
}

class _SpecialityListScreenState extends State<SpecialityListScreen> {
  final ScrollController _scrollController = ScrollController();
  int _selectedIndex = 0;
  String _searchQuery = '';

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

  final List<Map<String, String>> specialities = [
    {"name": "General Medicine", "image": "assets/generale.jpg"},
    {"name": "Dentistry", "image": "assets/dentiste.png"},
    {"name": "Psychology", "image": "assets/psychologie.jpg"},
    {"name": "Neurology", "image": "assets/neurology.png"},
    {"name": "Orthopedics", "image": "assets/orthopedics.png"},
    {"name": "Cardiology", "image": "assets/cardiology.png"},
    {"name": "Pediatrics", "image": "assets/pediatrics.png"},
    {"name": "Dermatology", "image": "assets/dermatology.png"},
    {"name": "Gastroenterology", "image": "assets/gastroenterology.png"},
    {"name": "Oncology", "image": "assets/oncology.png"},
    {"name": "Endocrinology", "image": "assets/endocrinology.png"},
    {"name": "Psychiatry", "image": "assets/psychiatry.png"},
    {"name": "Radiology", "image": "assets/radiology.png"},
    {"name": "Anesthesiology", "image": "assets/anesthesiology.png"},
    {"name": "Ophthalmology", "image": "assets/ophthalmology.png"},
    {
      "name": "Obstetrics and Gynecology",
      "image": "assets/obstetrics_gynecology.png",
    },
    {"name": "Urology", "image": "assets/urology.png"},
    {"name": "Nephrology", "image": "assets/nephrology.png"},
    {"name": "Pulmonology", "image": "assets/pulmonology.png"},
    {"name": "Hematology", "image": "assets/hematology.png"},
    {"name": "Immunology", "image": "assets/immunology.jpg"},
  ];

  List<Map<String, String>> get filteredSpecialities {
    if (_searchQuery.isEmpty) {
      return specialities;
    }
    return specialities.where((speciality) {
      return speciality["name"]!.toLowerCase().contains(
        _searchQuery.toLowerCase(),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
          ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 8.0,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF44a4a4).withOpacity(0.5),
                              blurRadius: 60.0,
                              offset: const Offset(0, 0),
                            ),
                          ],
                          shape: BoxShape.rectangle,
                        ),
                        child: Image.asset(
                          'assets/doctor_search.png',
                          width: 80,
                          height: 80,
                          fit: BoxFit.contain,
                          color: Colors.black,
                          colorBlendMode: BlendMode.srcIn,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Text(
                            S.of(context).findDoctor,
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                           Text(
                            S.of(context).bookappointment,
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xFF44a4a4),
                        blurRadius: 5.0,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration:  InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Icon(
                          Icons.search_rounded,
                          color: Color(0xFF44a4a4),
                        ),
                      ),
                      hintText: S.of(context).search,
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 201, 201, 201),
                        fontSize: 12.0,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 15.0,
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 15),
                Divider(color: Colors.grey),
                const SizedBox(height: 20),
                filteredSpecialities.isEmpty
                    ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/notfound.png',
                          height: 100,
                          width: 100,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'No specialities found',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    )
                    : GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 25.0,
                        mainAxisSpacing: 20.0,
                        childAspectRatio: 1.2,
                      ),
                      itemCount: filteredSpecialities.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) =>
                                      DoctorsList(),
                            ),
                          );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 2,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0xFF44a4a4),
                                    blurRadius: 5.0,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(6),
                                    child: Image.asset(
                                      filteredSpecialities[index]["image"]!,
                                      height: 25,
                                      width: 25,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    filteredSpecialities[index]["name"]!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 9,
                                    ),
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ],
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
}
