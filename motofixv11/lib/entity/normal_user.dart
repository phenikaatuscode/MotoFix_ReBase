import 'package:motofixv11/entity/user.dart';

class NormalUser extends User {
  List<String> _vehicles;

  NormalUser({
    required String userName,
    required String phoneNumber,
    required String email,
    required String password,
    required DateTime dateOfBirth,
    List<String> vehicles = const [],
  })  : _vehicles = vehicles,
        super(
        userName: userName,
        phoneNumber: phoneNumber,
        email: email,
        password: password,
        dateOfBirth: dateOfBirth,
      );

  List<String> get vehicles => _vehicles;
  set vehicles(List<String> value) => _vehicles = value;
}
