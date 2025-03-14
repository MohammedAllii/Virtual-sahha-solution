import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../Models/Doctor.dart';
import '../Models/Reservation.dart';
import '../utils/custom_navigation_bar.dart';

class MyCalendar extends StatefulWidget {
  const MyCalendar({Key? key}) : super(key: key);

  @override
  _MyCalendarState createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  late DateTime _selectedDay;
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  int selectedIndex = 5;


  /*  void _checkPatientExists() async {
    final authController = Get.find<AuthController>();
    final result = await authController.checkPatientExists();
    if (result['success'] == false) {
      Get.offAllNamed('/login');
    }
  }*/

  // Données statiques de réservation de médecin
  final List<Reservation> _events = [
    Reservation(
      id: "1",
      title: 'Consultation Cardiologie',
      date_reservation: DateTime.now().toString(),
      start_time: '09:00',
      end_time: '10:30',
      doctor: Doctor(
        name: 'Dr. Layla Ben Ahmed',
        speciality: 'Neurology',
        image: 'assets/doctor.png',
      ),
    ),
    Reservation(
      id: "2",
      title: 'Suivi Diabète',
      date_reservation: DateTime.now().add(const Duration(days: 2)).toString(),
      start_time: '09:00',
      end_time: '10:00',
      doctor: Doctor(
        name: 'Dr. Layla Ben Ahmed',
        speciality: 'Neurology',
        image: 'assets/doctor.png',
      ),
    ),
    Reservation(
      id: "3",
      title: 'Suivi Diabète',
      date_reservation: DateTime.now().add(const Duration(days: 2)).toString(),
      start_time: '14:00',
      end_time: '15:30',
      doctor: Doctor(
        name: 'Dr. Karim Yaakoubi',
        speciality: 'Neurology',
        image: 'assets/doctor2.png',
      ),
    ),
    Reservation(
      id: "4",
      title: 'Suivi Diabète',
      date_reservation: DateTime.now().add(const Duration(days: 5)).toString(),
      start_time: '08:00',
      end_time: '09:30',
      doctor: Doctor(
        name: 'Dr. Asma jebri',
        speciality: 'Neurology',
        image: 'assets/doctor.png',
      ),
    ),
  ];

  List<Reservation> _selectedReservations = [];

  final Map<String, double> _slidePositions = {};

  @override
  void initState() {
    super.initState();
   // _checkPatientExists();
    _selectedDay = DateTime.now();
    _selectedReservations =
        _events
            .where(
              (reservation) => isSameDay(
                DateTime.parse(reservation.date_reservation!),
                _selectedDay,
              ),
            )
            .toList();
  }

  List<Reservation> _getEventsForDay(DateTime day) {
    return _events
        .where(
          (reservation) =>
              isSameDay(DateTime.parse(reservation.date_reservation!), day),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF44a4a4), Colors.white],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFF44a4a4),
                      blurRadius: 5.0,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateFormat(
                          'EEEE, dd MMMM yyyy',
                          'en_US',
                        ).format(_selectedDay),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Icon(
                        Icons.calendar_month_outlined,
                        color: Colors.black,
                        size: 24.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 5),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
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
                      child: TableCalendar(
                        firstDay: DateTime.utc(2024, 01, 01),
                        lastDay: DateTime.utc(2026, 10, 20),
                        focusedDay: DateTime.now(),
                        calendarFormat: CalendarFormat.month,
                        sixWeekMonthsEnforced: false,
                        headerStyle: HeaderStyle(
                          titleTextStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        selectedDayPredicate: (day) {
                          return isSameDay(_selectedDay, day);
                        },
                        onDaySelected: (selectedDay, focusedDay) {
                          setState(() {
                            _selectedDay = selectedDay;
                            _selectedReservations =
                                _events
                                    .where(
                                      (reservation) => isSameDay(
                                        DateTime.parse(
                                          reservation.date_reservation!,
                                        ),
                                        _selectedDay,
                                      ),
                                    )
                                    .toList();
                          });
                        },
                        calendarStyle: CalendarStyle(
                          markersAlignment: Alignment.bottomCenter,
                          markerDecoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                          markerSize: 5.0,
                          selectedDecoration: BoxDecoration(
                            color: Color(0xFF44a4a4),
                            shape: BoxShape.circle,
                          ),
                          todayDecoration: BoxDecoration(
                            color: Color(0xFF44a4a4).withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                        ),
                        eventLoader: _getEventsForDay,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _selectedReservations.isNotEmpty
                      ? ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _selectedReservations.length,
                        itemBuilder: (context, index) {
                          return _buildDoctorAppointmentCard(
                            _selectedReservations[index],
                          );
                        },
                      )
                      : _buildNoAppointmentsWidget(),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ],
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
                onPressed: () {},
                child: Icon(Icons.calendar_month_outlined),
                backgroundColor: Colors.white,
                foregroundColor: Color(0xFF44a4a4),
              ),
            ),
          ),
          bottomNavigationBar: CustomBottomNavBar(selectedIndex: selectedIndex),
      
    );
  }

  Widget _buildDoctorAppointmentCard(Reservation reservation) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        setState(() {
          // Ajuster la sensibilité du glissement en multipliant details.delta.dx
          double newPosition =
              (_slidePositions[reservation.id] ?? 0) + (details.delta.dx * 1.5);
          _slidePositions[reservation.id] = newPosition.clamp(-200, 0);
        });
      },
      // Ajouter la gestion de fin de glissement
      onHorizontalDragEnd: (details) {
        final position = _slidePositions[reservation.id] ?? 0;
        setState(() {
          // Si glissé plus que la moitié, ouvrir complètement
          if (position < -100) {
            _slidePositions[reservation.id] = -200;
          } else {
            // Sinon, retourner à la position initiale
            _slidePositions[reservation.id] = 0;
          }
        });
      },
      child: Stack(
        children: [
          Positioned(
            right: 20,
            top: 12,
            bottom: 12,
            child: Row(
              children: [
                _buildActionButton(
                  Icons.remove_red_eye_outlined,
                  Colors.blue,
                  () {
                    setState(() {
                      _slidePositions[reservation.id] = 0;
                    });
                  },
                ),
                const SizedBox(width: 12),
                _buildActionButton(Icons.edit, Colors.green, () {
                  setState(() {
                    _slidePositions[reservation.id] = 0;
                  });
                }),
                const SizedBox(width: 12),
                _buildActionButton(Icons.cancel, Colors.red, () {
                  setState(() {
                    _slidePositions[reservation.id] = 0;
                  });
                }),
              ],
            ),
          ),
          // Carte principale
          AnimatedContainer(
            duration: const Duration(milliseconds: 50),
            curve: Curves.easeInOutBack,
            transform: Matrix4.translationValues(
              _slidePositions[reservation.id] ?? 0,
              0,
              0,
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                      image: DecorationImage(
                        image: AssetImage(reservation.doctor!.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            reservation.doctor!.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF44a4a4),
                            ),
                          ),
                          const SizedBox(height: 2),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                reservation.doctor!.speciality,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                              _buildSwipeIndicator(),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              const SizedBox(width: 5),
                              const Icon(
                                Icons.access_time,
                                size: 16,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                '${reservation.start_time} - ${reservation.end_time}',
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, Color color, VoidCallback onTap) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: color.withOpacity(0.9),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          customBorder: const CircleBorder(),
          child: Icon(icon, color: Colors.white, size: 28),
        ),
      ),
    );
  }

  Widget _buildSwipeIndicator() {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: -3.0, end: 3.0),
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(value, 0),
          child: const Row(
            children: [Icon(Icons.swipe_left, size: 23, color: Colors.black)],
          ),
        );
      },
      onEnd: () {
        // Reconstruire le widget pour relancer l'animation
        setState(() {});
      },
    );
  }

  Widget _buildNoAppointmentsWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/notfound.png', width: 100),
          const SizedBox(height: 20),
          Text(
            'No appointments scheduled',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'You have no scheduled consultations',
            style: TextStyle(fontSize: 14, color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }
}
