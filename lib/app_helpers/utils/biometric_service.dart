import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_darwin/local_auth_darwin.dart';

class BiometricService {
  final LocalAuthentication auth = LocalAuthentication();

  Future<bool> canCheckBiometrics() async {
    try {
      final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
      final bool canAuthenticate =
          canAuthenticateWithBiometrics || await auth.isDeviceSupported();
      return canAuthenticate;
    } catch (e) {
      return false;
    }
  }

  Future<bool> authenticate() async {
    try {
      // Device support check
      bool isSupported = await auth.isDeviceSupported();
      if (!isSupported) return false;
      return await auth.authenticate(
        localizedReason: 'Please authenticate to proceed with your attendance',
        authMessages: const <AuthMessages>[
          AndroidAuthMessages(
            signInTitle: 'Biometric Authentication',
            cancelButton: 'Cancel',
          ),
          IOSAuthMessages(cancelButton: 'Cancel'),
        ],
        biometricOnly: false,
        sensitiveTransaction: true,
        persistAcrossBackgrounding: true,
      );
    } catch (e) {
      print("Biometric Error: $e");
      return false;
    }
  }
}
