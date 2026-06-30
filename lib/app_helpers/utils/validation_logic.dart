class AppValidationLogic {
  AppValidationLogic._();

  static final RegExp emailRegExp = RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+"
    r"@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?"
    r"(?:\.[a-zA-Z]{2,})+$",
  );
  static final RegExp phoneRegExp = RegExp(r'^\+?[1-9]\d{9,14}$');
  static final RegExp phoneIndianRegExp = RegExp(r'^\+91[6-9]\d{9}$');
  static String sanitizePhone(String input) =>
      input.replaceAll(RegExp(r'[\s()-]'), '');
  static bool validateIndianNumber(String number) {
    final regex = RegExp(r'^\+91[6-9]\d{9}$');
    return regex.hasMatch(number);
  }

  static String normalizeIndianNumber(String rawNumber) {
    String formattedPhone = sanitizePhone(rawNumber);

    // Normalize typical formats to +91
    if (RegExp(r'^[6-9]\d{9}$').hasMatch(formattedPhone)) {
      formattedPhone = '+91$formattedPhone';
    } else if (RegExp(r'^91[6-9]\d{9}$').hasMatch(formattedPhone)) {
      formattedPhone = '+$formattedPhone';
    } else if (RegExp(r'^0[6-9]\d{9}$').hasMatch(formattedPhone)) {
      formattedPhone = '+91${formattedPhone.substring(1)}';
    }

    return formattedPhone;
  }
}
