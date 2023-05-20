class User {
  String _userName;
  String _phoneNumber;
  String _email;
  String _password;
  DateTime _dateOfBirth;

  User({
    required String userName,
    required String phoneNumber,
    required String email,
    required String password,
    required DateTime dateOfBirth,
  })  : _userName = userName,
        _phoneNumber = phoneNumber,
        _email = email,
        _password = password,
        _dateOfBirth = dateOfBirth;

  String get userName => _userName;
  set userName(String value) => _userName = value;

  String get phoneNumber => _phoneNumber;
  set phoneNumber(String value) => _phoneNumber = value;

  String get email => _email;
  set email(String value) => _email = value;

  String get password => _password;
  set password(String value) => _password = value;

  DateTime get dateOfBirth => _dateOfBirth;
  set dateOfBirth(DateTime value) => _dateOfBirth = value;
}
