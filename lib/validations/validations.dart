bool validatePhone(String phone) {
  if (phone.length == 10) {
    int integerPhone = int.tryParse(phone) ?? -1;

    if (integerPhone != -1) {
      return true;
    }
  }

  return false;
}