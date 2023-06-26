import 'package:hive/hive.dart';


@HiveType(typeId: 0)
class Profile extends HiveObject {
  @HiveField(0)
  String fullName;

  @HiveField(1)
  String email;

  @HiveField(2)
  String phoneNumber;

  Profile({required this.fullName, required this.email, required this.phoneNumber});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }
}
