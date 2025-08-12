extension StringValidators on String {
  bool get isEmail {
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return regex.hasMatch(trim());
  }

  bool isPasswordBasic({int minLength = 8}) {
    final pattern =
        r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#\$%^&*()_\-+=\[\]{}|;:,.<>/?]).{' +
        minLength.toString() +
        r',}$';
    return RegExp(pattern).hasMatch(this);
  }
}
