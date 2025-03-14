import 'Doctor.dart';
import 'User.dart';

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

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      id: json['id'].toString(),
      title: json['title'],
      date_reservation: json['date_reservation'],
      start_time: json['start_time'],
      end_time: json['end_time'],
      doctor: Doctor.fromJson(json['doctor']), 
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date_reservation': date_reservation,
        'start_time': start_time,
        'end_time': end_time,
        'doctor': doctor?.toJson(), 
      };
}
