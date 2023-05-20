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


}
