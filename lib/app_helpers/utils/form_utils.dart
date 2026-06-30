import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nax_bull_trade/app_helpers/utils/validation_logic.dart';

class AppFormValidators {
  AppFormValidators._();

  /// Required field validator
  static FormFieldValidator<String> required({String fieldName = 'Field'}) {
    return (value) {
      if (value == null || value.trim().isEmpty) {
        return 'Please enter your $fieldName';
      }
      return null;
    };
  }

  /// Email validator
  static FormFieldValidator<String> email() {
    return (value) {
      final input = value?.trim();

      if (input == null || input.isEmpty) {
        return 'Please enter your email';
      }

      if (!AppValidationLogic.emailRegExp.hasMatch(input)) {
        return 'Please enter a valid email address';
      }

      return null;
    };
  }

  /// Mobile validator (E.164)
  static FormFieldValidator<String> mobile() {
    return (value) {
      final input = value?.trim();

      if (input == null || input.isEmpty) {
        return 'Please enter your mobile number';
      }

      final sanitized = AppValidationLogic.sanitizePhone(input);

      if (!AppValidationLogic.phoneRegExp.hasMatch(sanitized)) {
        return 'Please enter a valid mobile number';
      }

      return null;
    };
  }

  /// OTP validator
  static FormFieldValidator<String> otp({int length = 4}) {
    return (value) {
      final input = value?.trim();

      if (input == null || input.isEmpty) {
        return 'Please enter the OTP';
      }

      // if (!RegExp(r'^\d+$').hasMatch(input)) {
      //   return 'OTP must contain only digits';
      // }

      if (input.length != length) {
        return 'Please enter a $length-digit OTP';
      }

      return null;
    };
  }

  /// Password validator
  static FormFieldValidator<String> password({int minLength = 6}) {
    return (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your password';
      }

      if (value.length < minLength) {
        return 'Password must be at least $minLength characters long';
      }

      if (!RegExp(r'[A-Z]').hasMatch(value)) {
        return 'Password must contain at least one uppercase letter';
      }

      if (!RegExp(r'[a-z]').hasMatch(value)) {
        return 'Password must contain at least one lowercase letter';
      }

      if (!RegExp(r'\d').hasMatch(value)) {
        return 'Password must contain at least one digit';
      }

      if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
        return 'Password must contain at least one special character';
      }

      return null;
    };
  }

  /// Confirm password validator
  static FormFieldValidator<String> confirmPassword(
    String Function() passwordProvider,
  ) {
    return (value) {
      if (value == null || value.isEmpty) {
        return 'Please confirm your password';
      }

      if (value != passwordProvider()) {
        return 'Passwords do not match';
      }

      return null;
    };
  }

  static FormFieldValidator<String> date() {
    return (value) {
      if (value == null || value.trim().isEmpty) {
        return 'Please select date and time';
      }
      return null;
    };
  }
}

class AppInputFormatters {
  AppInputFormatters._();

  static final digitsOnly = FilteringTextInputFormatter.digitsOnly;

  static TextInputFormatter lengthLimit(int length) =>
      LengthLimitingTextInputFormatter(length);

  static final singleLine = FilteringTextInputFormatter.singleLineFormatter;

  static final phoneFormatter = FilteringTextInputFormatter.allow(
    RegExp(r'[0-9+\s()-]'),
  );

  static final emailFormatter = FilteringTextInputFormatter.deny(RegExp(r'\s'));

  static final passwordFormatter = FilteringTextInputFormatter.deny(
    RegExp(r'\s'),
  );

  static final otpFormatter = FilteringTextInputFormatter.digitsOnly;

  static final nameFormatter = FilteringTextInputFormatter.allow(
    RegExp(r"[a-zA-Z\s]"),
  );

  static final addressFormatter =
      FilteringTextInputFormatter.singleLineFormatter;

  static final cityFormatter = FilteringTextInputFormatter.allow(
    RegExp(r"[a-zA-Z\s]"),
  );

  static final stateFormatter = FilteringTextInputFormatter.allow(
    RegExp(r"[a-zA-Z\s]"),
  );

  static final pincodeFormatter = FilteringTextInputFormatter.digitsOnly;

  static final descriptionFormatter = FilteringTextInputFormatter.deny(
    RegExp(
      r'(\+?\d{1,3}[- ]?)?\d{10}|(\+?\d{1,3}[- ]?)?\d{3}[- ]?\d{3}[- ]?\d{4}',
    ),
  );
  static final descriptionEmailFormatter = FilteringTextInputFormatter.deny(
    RegExp(r'\b[\w\.-]+@[\w\.-]+\.\w{2,4}\b'),
  );
  static final descriptionUrlFormatter = FilteringTextInputFormatter.deny(
    RegExp(
      r'((https?:\/\/)?(www\.)?[a-zA-Z0-9-]+\.[a-zA-Z]{2,}(\.[a-zA-Z]{2,})?)',
    ),
  );
}
