import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginEvent extends AuthEvent {
  final String? phone;


  LoginEvent({this.phone,});

  @override
  List<Object?> get props => [phone,];
}
class VerifyOtpEvent extends AuthEvent {
  final String? phone;
  final String? otp;


  VerifyOtpEvent({this.phone,this.otp});

  @override
  List<Object?> get props => [phone,otp];
}

class SetMpinEvent extends AuthEvent {
  final String? mpin;
  final String? mpin_confirmation;


  SetMpinEvent({this.mpin,this.mpin_confirmation});

  @override
  List<Object?> get props => [mpin,mpin_confirmation];
}

class verifyMpinEvent extends AuthEvent {
  final String? mpin;
  final String? phone;


  verifyMpinEvent({this.mpin,this.phone});

  @override
  List<Object?> get props => [mpin,phone];
}

class forgotMpinEvent extends AuthEvent {
  final String? phone;


  forgotMpinEvent({this.phone});

  @override
  List<Object?> get props => [phone];
}

class ResetMpinEvent extends AuthEvent {
  final String? phone;
  final String? otp;
  final String? mpin;
  final String? mpin_confirmation;


  ResetMpinEvent({this.phone,this.mpin,this.otp,this.mpin_confirmation});

  @override
  List<Object?> get props => [phone,otp,mpin,mpin_confirmation];

}
class KycEvent extends AuthEvent {
  final String? name;
  final String? pan_number;
  final String? aadhaar_number;
  final String? account_number;
  final String? ifsc_code;


  KycEvent({this.name,this.pan_number,this.aadhaar_number,this.account_number,this.ifsc_code});

  @override
  List<Object?> get props => [name,pan_number,aadhaar_number,account_number,ifsc_code];
}