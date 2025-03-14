import 'package:flutter/material.dart';
import 'package:vsahha/MyCalendar/my_calendar.dart';
import 'package:vsahha/generated/l10n.dart' show S;
import 'package:vsahha/utils/custom_navigation_bar.dart';

import '../Models/Doctor.dart';
import '../Models/Reservation.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPage();
}

class _NotificationPage extends State<NotificationPage> {
  int selectedIndex = 2;

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

  final List<Reservation> _reservations = [
    Reservation(
      id: "1",
      title: 'Consultation Cardiologie',
      date_reservation: DateTime.now().toIso8601String().split('T')[0],
      start_time: '09:00:00',
      end_time: '10:30:00',
      doctor: Doctor(
        name: 'Dr. Layla Ben Ahmed',
        speciality: 'Neurology',
        image: 'assets/doctor.png',
      ),
    ),
    Reservation(
      id: "2",
      title: 'Consultation 2',
      date_reservation:
          DateTime.now().add(Duration(days: 2)).toIso8601String().split('T')[0],
      start_time: '09:00:00',
      end_time: '12:00:00',
      doctor: Doctor(
        name: 'Dr. Layla Ben Ahmed',
        speciality: 'Neurology',
        image: 'assets/doctor.png',
      ),
    ),
    Reservation(
      id: "3",
      title: 'Consultation 3',
      date_reservation:
          DateTime.now().add(Duration(days: 2)).toIso8601String().split('T')[0],
      start_time: '14:00:00',
      end_time: '16:30:00',
      doctor: Doctor(
        name: 'Dr. Karim Yaakoubi',
        speciality: 'Neurology',
        image: 'assets/doctor2.png',
      ),
    ),
    Reservation(
      id: "4",
      title: 'Consultation 4',
      date_reservation:
          DateTime.now().add(Duration(days: 5)).toIso8601String().split('T')[0],
      start_time: '08:00:00',
      end_time: '09:30:00',
      doctor: Doctor(
        name: 'Dr. Asma Jebri',
        speciality: 'Neurology',
        image: 'assets/doctor.png',
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          bottom: TabBar(
            indicatorColor: Color(0xFF44a4a4),
            labelColor: Color(0xFF44a4a4),
            tabs: [
              Tab(icon: Icon(Icons.all_inbox), text: S.of(context).all),
              Tab(icon: Icon(Icons.mark_email_unread), text: S.of(context).unread),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                SizedBox(height: 5.0),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(16.0),
                    itemCount: _reservations.length + 1,
                    itemBuilder: (context, index) {
                      if (index < _reservations.length) {
                        final reservation = _reservations[index];
                        return Container(
                          margin: EdgeInsets.only(bottom: 16.0),
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
                          child: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 35,
                                  backgroundImage: AssetImage(
                                    reservation.doctor.image,
                                  ),
                                  backgroundColor: Colors.white,
                                ),
                                SizedBox(width: 16.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                reservation.title,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            width: 10,
                                            height: 10,
                                            decoration: BoxDecoration(
                                              color: Colors.blue,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5.0),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.person,
                                            size: 16,
                                            color: Colors.grey,
                                          ),
                                          SizedBox(width: 8.0),
                                          Text('${reservation.doctor.name}'),
                                        ],
                                      ),
                                      SizedBox(height: 5.0),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.access_time,
                                            size: 16,
                                            color: Colors.grey,
                                          ),
                                          SizedBox(width: 8.0),
                                          Text('il y a 2 heures'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Column(
                          children: [
                            SizedBox(height: 40),
                            Container(
                              margin: EdgeInsets.only(bottom: 16.0),
                              height: 60,
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
                              child: TextButton(
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.check, color: Colors.black),
                                    SizedBox(width: 8.0),
                                    Text(
                                      "Marquer tout comme lu",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 16.0),
                              decoration: BoxDecoration(
                                color: Color(0xFF44a4a4).withOpacity(0.2),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0xFF44a4a4),
                                    blurRadius: 5.0,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: SizedBox(height: 60),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
            Center(child: Text("Notifications non lues")),
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
      ),
    );
  }
}
