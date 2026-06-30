import 'package:equatable/equatable.dart';

abstract class DashboardEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Initial dashboard load
class DashboardDataEvent extends DashboardEvent {

  DashboardDataEvent();

  @override
  List<Object?> get props => [];

}
