import 'package:flutter/material.dart';
import 'package:vsahha/MyCalendar/my_calendar.dart';
import 'package:vsahha/generated/l10n.dart';
import 'package:vsahha/utils/custom_navigation_bar.dart';
import 'package:calendar_timeline/calendar_timeline.dart';

class ReservationPage extends StatefulWidget {
  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  DateTime _selectedOldDate = DateTime.now();
  DateTime _selectedUpcomingDate = DateTime.now();
  int selectedIndex = 7;


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
        name: 'Dr. Hamouda Méjri',
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
  void initState() {
    super.initState();
   // _checkPatientExists();
    _tabController = TabController(length: 2, vsync: this);
  }

  List<Reservation> getOldReservations(DateTime date) {
    return _reservations.where((res) {
      DateTime reservationDate = DateTime.parse(res.date_reservation);
      return reservationDate.isBefore(DateTime.now()) &&
          reservationDate.isSameDate(date);
    }).toList();
  }

  List<Reservation> getUpcomingReservationsForCalendar(DateTime date) {
    return _reservations.where((res) {
      DateTime reservationDate = DateTime.parse(res.date_reservation);
      return reservationDate.isAfter(DateTime.now()) &&
          reservationDate.isSameDate(date);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

              appBar: AppBar(
          ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 16),
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
                    Image.asset(
                      'assets/online_booking.png',
                      width: 70,
                      height: 70,
                    ),
                    const SizedBox(width: 5),
                     Expanded(
                      child: Text(
                        S.of(context).allappointments,
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
              const SizedBox(height: 20),
              TabBar(
                controller: _tabController,
                indicatorColor: const Color(0xFF44a4a4),
                labelColor: const Color(0xFF44a4a4),
                tabs:  [
                  Tab(text: S.of(context).encien),
                  Tab(text: S.of(context).avenir),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color(0xFF44a4a4),
                                        blurRadius: 5.0,
                                        offset: Offset(0, 5),
                                      ),
                                    ],
                                  ),
                                  child:  Text(
                                    S.of(context).filterbydate,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF44a4a4),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    elevation: 5,
                                  ),
                                  onPressed: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: _selectedOldDate,
                                      firstDate: DateTime(2020),
                                      lastDate: DateTime.now(),
                                    );
                                    if (pickedDate != null) {
                                      setState(() {
                                        _selectedOldDate = pickedDate;
                                      });
                                    }
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.calendar_month_outlined,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        '${_selectedOldDate.year}-${_selectedOldDate.month}-${_selectedOldDate.day}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),

                          getOldReservations(_selectedOldDate).isEmpty
                              ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/notfound.png',
                                      width: 100,
                                      height: 100,
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      'Aucune ancienne réservation disponible.',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              )
                              : ListView(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                children:
                                    getOldReservations(_selectedOldDate)
                                        .map(
                                          (res) =>
                                              ReservationCard(reservation: res),
                                        )
                                        .toList(),
                              ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
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
                            const SizedBox(height: 5),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0xFF44a4a4),
                                    blurRadius: 5.0,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 5,
                              ),
                              child: CalendarTimeline(
                                initialDate: _selectedUpcomingDate,
                                firstDate: DateTime.now().subtract(
                                  Duration(days: 365),
                                ),
                                lastDate: DateTime.now().add(
                                  Duration(days: 365),
                                ),
                                onDateSelected: (date) {
                                  setState(() {
                                    _selectedUpcomingDate = date;
                                  });
                                },
                                monthColor: Colors.blueGrey,
                                dayColor: Colors.black,
                                activeDayColor: Colors.white,
                                activeBackgroundDayColor: const Color(
                                  0xFF44a4a4,
                                ),
                                locale: 'en',
                              ),
                            ),
                            SizedBox(height: 5),
                            getUpcomingReservationsForCalendar(
                                  _selectedUpcomingDate,
                                ).isEmpty
                                ? Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/notfound.png',
                                        width: 100,
                                        height: 100,
                                      ),
                                      const SizedBox(height: 10),
                                      const Text(
                                        'Aucune réservation à venir disponible.',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                )
                                : ListView(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  children:
                                      getUpcomingReservationsForCalendar(
                                            _selectedUpcomingDate,
                                          )
                                          .map(
                                            (res) => ReservationCard(
                                              reservation: res,
                                            ),
                                          )
                                          .toList(),
                                ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
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
}

class ReservationCard extends StatelessWidget {
  final Reservation reservation;

  const ReservationCard({required this.reservation});

  @override
  Widget build(BuildContext context) {
    DateTime startTime = _parseDateTime(
      reservation.date_reservation,
      reservation.start_time,
    );
    DateTime endTime = _parseDateTime(
      reservation.date_reservation,
      reservation.end_time,
    );

    print('Start Time: $startTime');
    print('End Time: $endTime');

    String timeAgoEnd = _timeAgo(endTime);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF44a4a4),
              blurRadius: 5,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(reservation.doctor.image),
                backgroundColor: Colors.white,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      reservation.title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'Médecin: ${reservation.doctor.name}',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Text(
                      'Spécialité: ${reservation.doctor.speciality}',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          'Il y a ${timeAgoEnd}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.blue,
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
      ),
    );
  }

  DateTime _parseDateTime(String date, String time) {
    try {
      final datePart = DateTime.parse(date).toIso8601String().split('T')[0];
      return DateTime.parse('$datePart $time');
    } catch (e) {
      print('Error parsing date: $date and time: $time');
      return DateTime.now(); // Fallback
    }
  }

  String _timeAgo(DateTime dateTime) {
    final Duration difference = DateTime.now().difference(dateTime);
    print('Difference: ${difference.inMinutes} minutes');
    if (difference.inDays > 0) {
      return '${difference.inDays} jour${difference.inDays > 1 ? 's' : ''}';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} heure${difference.inHours > 1 ? 's' : ''}';
    } else {
      return '3 heures';
    }
  }
}

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}

class Reservation {
  final String id;
  final String title;
  final String date_reservation;
  final String start_time;
  final String end_time;
  final Doctor doctor;

  Reservation({
    required this.id,
    required this.title,
    required this.date_reservation,
    required this.start_time,
    required this.end_time,
    required this.doctor,
  });
}

class Doctor {
  final String name;
  final String speciality;
  final String image;

  Doctor({required this.name, required this.speciality, required this.image});
}
