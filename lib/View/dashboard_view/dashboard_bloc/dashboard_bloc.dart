import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app_helpers/network/api_base_helper.dart';
import 'dashboard_event.dart';
import 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final AuthRepository repository;

  DashboardBloc(this.repository) : super(DashboardInitial()) {
    on<DashboardDataEvent>((event, emit) async {
      emit(DashboardLoading());

      try {
        final user = await repository.dashboardApi();

        emit(DashboardSuccess(user));
      } catch (e) {
        emit(DashboardError(e.toString()));
      }
    });

  }
}
