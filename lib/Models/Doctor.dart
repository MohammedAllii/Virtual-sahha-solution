class Doctor {
  final String name;
  final String speciality;
  final String image;

  Doctor({
    required this.name,
    required this.speciality,
    required this.image,
  });

    factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      name: json['name'].toString(),
      speciality: json['speciality'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'speciality': speciality,
        'image': image,
      };
}