class Validator {
  static bool nullValidator({required String value}) {
    if (value.isEmpty) {
      return true;
    }
    return false;
  }
}
