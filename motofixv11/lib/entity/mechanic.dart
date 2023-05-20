import 'package:motofixv11/entity/user.dart';

class Mechanic extends User {
  String _currentWorkplace;

  Mechanic({
    required String userName,
    required String phoneNumber,
    required String email,
    required String password,
    required DateTime dateOfBirth,
    required String currentWorkplace,
  })  : _currentWorkplace = currentWorkplace,
        super(
        userName: userName,
        phoneNumber: phoneNumber,
        email: email,
        password: password,
        dateOfBirth: dateOfBirth,
      );

  String get currentWorkplace => _currentWorkplace;
  set currentWorkplace(String value) => _currentWorkplace = value;
}
