import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vsahha/MyCalendar/my_calendar.dart';
import 'package:vsahha/controller/auth_controller.dart';
import 'package:vsahha/generated/l10n.dart';

import '../utils/custom_navigation_bar.dart';

class FavorisDoctors extends StatefulWidget {
  const FavorisDoctors({super.key});

  @override
  _FavorisDoctorsState createState() => _FavorisDoctorsState();
}

class _FavorisDoctorsState extends State<FavorisDoctors> {
  List<Map<String, dynamic>> doctors = [
    {
      "name": "Dr. Layla Ben Ahmed",
      "specialty": "Neurology",
      "image": "assets/doctor.png",
      "rating": 4.6,
      "isActive": true,
    },
    {
      "name": "Dr. Ahmed Ben Fraj",
      "specialty": "Cardiology",
      "image": "assets/doctor2.png",
      "rating": 4.5,
      "isActive": false,
    },
    {
      "name": "Dr. Sara Trabelsi",
      "specialty": "Dermatology",
      "image": "assets/doctor3.png",
      "rating": 4.8,
      "isActive": true,
    },
  ];
  int selectedIndex = 10;

  List<Map<String, dynamic>> _favoriteDoctors = [];

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
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 17),
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
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
                  const Icon(Icons.star, color: Color.fromARGB(255, 243, 221, 17), size: 30),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      S.of(context).myfavoris,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: _buildDoctorsList(),
            ),
          ),
        ],
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

  Widget _buildDoctorsList() {
    return doctors.isEmpty
        ? const Center(child: CupertinoActivityIndicator())
        : ListView.builder(
          itemCount: doctors.length,
          itemBuilder: (context, index) {
            final doctor = doctors[index];
            bool isFavorite = _favoriteDoctors.contains(doctor);

            return Container(
              margin: const EdgeInsets.only(bottom: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: const Color.fromARGB(255, 213, 213, 213), width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(
                                      0xFF44a4a4,
                                    ).withOpacity(0.5),
                                    blurRadius: 5.0,
                                    offset: const Offset(0, 20),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(
                                  8,
                                ), // Appliquer la même bordure ici
                              ),
                              child: Image.asset(
                                doctor['image'],
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                doctor["name"],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: isFavorite ? Colors.red : Colors.black,
                                ),
                                onPressed: () {
                                  _toggleFavoriteDoctor(doctor);
                                  _showDeleteConfirmationModal();
                                },
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF44a4a4).withOpacity(0.5),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              doctor["specialty"],
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
  }

  void _showDeleteConfirmationModal() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          title: const Text('Are you sure you want to delete all favorites?'),
          actions: [
            CupertinoActionSheetAction(
              onPressed: () async {
                atch(e) {}
              },
              isDestructiveAction: true,
              child: const Text('Delete'),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context);
              },
              isDestructiveAction: false,
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _toggleFavoriteDoctor(Map<String, dynamic> doctor) {
    setState(() {
      if (_favoriteDoctors.contains(doctor)) {
        _favoriteDoctors.remove(doctor);
      } else {
        _favoriteDoctors.add(doctor);
      }
    });
  }
}
