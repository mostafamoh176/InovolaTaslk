part of 'reservation_cubit.dart';

@immutable
abstract class ReservationState extends Equatable {
  const ReservationState();

  @override
  List<Object> get props => [];
}

class ReservationInitial extends ReservationState {}

class LoadingGetReservationState extends ReservationState {}

class SuccessGetReservationState extends ReservationState {
  final List<Reservation> reservation;

  SuccessGetReservationState({required this.reservation});

  @override
  List<Object> get props => [reservation];
}

class ErrorGetReservationState extends ReservationState {
  final String message;

  ErrorGetReservationState({required this.message});

  @override
  List<Object> get props => [message];
}

class ChangeIconColor extends ReservationState {}
