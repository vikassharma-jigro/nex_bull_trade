import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app_helpers/network/api_base_helper.dart';
import '../../../model/auth_model.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc(this.repository) : super(AuthInitial()) {

    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());

      try {
        final user = await repository.login(
          event.phone ?? "",
        );

        emit(AuthSuccess(user));
      } on DioException catch (e) {
         final errorModel = UserModel.fromJson(e.response?.data ?? {});
        //
         emit(AuthError(errorModel));
      } catch (e) {
        //emit(AuthError(ErrorModel(message: "Unexpected error occurred")));
      }
    });

    on<VerifyOtpEvent>((event, emit) async {
      emit(AuthLoading());

      try {
        final user = await repository.verifyOtp(
          event.phone ?? '',
          event.otp ??'',
        );

        emit(AuthSuccess(user));
      } on DioException catch (e) {
         final errorModel = UserModel.fromJson(e.response?.data ?? {});
        //
         emit(AuthError(errorModel));
      } catch (e) {
        emit(AuthError(UserModel(message: "Unexpected error occurred")));
      }
    });

    on<SetMpinEvent>((event, emit) async {
      emit(AuthLoading());

      try {
        final user = await repository.setMpinApi(
          event.mpin ?? '',
          event.mpin_confirmation ?? '',
        );

        emit(AuthSuccess(user));
      } on DioException catch (e) {
        final responseData = e.response?.data;

        if (responseData is Map<String, dynamic>) {
          emit(
            AuthError(
              UserModel.fromJson(responseData),
            ),
          );
        } else {
          emit(
            AuthError(
              UserModel(
                message: responseData?.toString() ?? 'Something went wrong',
              ),
            ),
          );
        }
      } catch (e) {
        emit(
          AuthError(
            UserModel(
              message: 'Unexpected error occurred',
            ),
          ),
        );
      }
    });

    on<verifyMpinEvent>((event, emit) async {
      emit(AuthLoading());

      try {
        final user = await repository.verifyMpinApi(
          event.mpin ?? '',
          event.phone??''
        );

        emit(AuthSuccess(user));
      } on DioException catch (e) {
         final errorModel = UserModel.fromJson(e.response?.data ?? {});
        //
         emit(AuthError(errorModel));
      } catch (e) {
        emit(AuthError(UserModel(message: "Unexpected error occurred")));
      }
    });

    on<forgotMpinEvent>((event, emit) async {
      emit(AuthLoading());

      try {
        final user = await repository.forgetMpinApi(
          event.phone ?? '',
        );

        emit(AuthSuccess(user));
      } on DioException catch (e) {
         final errorModel = UserModel.fromJson(e.response?.data ?? {});
        //
         emit(AuthError(errorModel));
      } catch (e) {
        emit(AuthError(UserModel(message: "Unexpected error occurred")));
      }
    });
    on<ResetMpinEvent>((event, emit) async {
      emit(AuthLoading());

      try {
        final user = await repository.resetMpinApi(
          event.phone ?? '',
          event.otp ?? '',
          event.mpin ?? '',
          event.mpin_confirmation ?? '',
        );

        emit(AuthSuccess(user));
      } on DioException catch (e) {
         final errorModel = UserModel.fromJson(e.response?.data ?? {});
        //
         emit(AuthError(errorModel));
      } catch (e) {
        emit(AuthError(UserModel(message: "Unexpected error occurred")));
      }
    });


    on<KycEvent>((event, emit) async {
      emit(AuthLoading());

      try {
        final user = await repository.kycApi(
            event.name ?? '',
            event.aadhaar_number??'',
            event.pan_number??'',
            event.ifsc_code??'',
            event.account_number??''
        );

        emit(AuthSuccess(user));
      } on DioException catch (e) {
        final errorModel = UserModel.fromJson(e.response?.data ?? {});
        //
        emit(AuthError(errorModel));
      } catch (e) {
        emit(AuthError(UserModel(message: "Unexpected error occurred")));
      }
    });
  }
}

// onPressed: () {
// context.read<AuthBloc>().add(
// LoginEvent(
// email: emailController.text,
// password: passwordController.text,
// ),
// );
// }
