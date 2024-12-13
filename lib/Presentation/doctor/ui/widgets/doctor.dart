class Doctor {
  final String name;
  final String title;
  final String about;
  final String location;
  final String city;
  final String governorate;
  final String consultationFee;
  final String profileImage;

  Doctor({
    required this.name,
    required this.title,
    required this.about,
    required this.location,
    required this.city,
    required this.governorate,
    required this.consultationFee,
    required this.profileImage,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      name: json['name'],
      title: json['title'],
      about: json['about'],
      location: json['location'],
      city: json['city'],
      governorate: json['governorate'],
      consultationFee: json['consultation_fee'],
      profileImage: json['profile_image'],
    );
  }
}
