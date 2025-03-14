import 'package:flutter/material.dart';
import 'package:vsahha/Booking/booking.dart';
import 'package:vsahha/Home/doctor_details.dart';
import 'package:vsahha/MyCalendar/my_calendar.dart';
import 'package:vsahha/generated/l10n.dart';
import 'package:vsahha/utils/custom_navigation_bar.dart'
    show CustomBottomNavBar;

class DoctorsList extends StatefulWidget {
  @override
  _DoctorsListState createState() => _DoctorsListState();
}

int selectedIndex = 0;

final List<Map<String, dynamic>> _doctors = [
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

final List<Map<String, String>> _categories = [
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

class _DoctorsListState extends State<DoctorsList> {
  String? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    final filteredDoctors =
        _selectedCategory == null
            ? _doctors
            : _doctors
                .where((doctor) => doctor['specialty'] == _selectedCategory)
                .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children:
                  _categories.map((category) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: ChoiceChip(
                        backgroundColor: Colors.white,
                        label: Row(
                          children: [
                            Image.asset(
                              category['image']!,
                              width: 20,
                              height: 20,
                            ),
                            SizedBox(width: 5),
                            Text(
                              category['name']!,
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                        selected: _selectedCategory == category['name'],
                        onSelected: (selected) {
                          setState(() {
                            _selectedCategory =
                                selected ? category['name'] : null;
                          });
                        },
                      ),
                    );
                  }).toList(),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.builder(
                itemCount: filteredDoctors.length,
                itemBuilder: (context, index) {
                  final doctor = filteredDoctors[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DoctorDetails(),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 16.0),
                      padding: EdgeInsets.only(
                        top: 13.0,
                        left: 13.0,
                        right: 7.0,
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
                                  children: [
                                    Text(
                                      doctor['name'],
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Spacer(),
                                    IconButton(
                                      icon: Icon(Icons.favorite_border),
                                      onPressed: () {
                                        // Action pour ajouter aux favoris
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(height: 1.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(
                                          0xFF44a4a4,
                                        ).withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        doctor['specialty'],
                                        style: const TextStyle(
                                          fontSize: 9,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Row(
                                      children: [
                                        Text(
                                          doctor['rating'].toString(),
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 1.0),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ElevatedButton.icon(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder:
                                                  (context) => BookingPage(),
                                            ),
                                          );
                                        },
                                        icon: Icon(
                                          Icons.calendar_month_outlined,
                                          color: Colors.white,
                                        ),
                                        label: Text(
                                          S.of(context).bookNow,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                            ),
                                          ),
                                          backgroundColor: Color(0xFF44a4a4),
                                        ),
                                      ),
                                    ],
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
              ),
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
}
