import 'package:dartz/dartz.dart';
import 'package:inovolatask/core/errors/failures.dart';
import 'package:inovolatask/feature/domain/entites/reservation.dart';
import 'package:inovolatask/feature/domain/repositories/reservation_repositories.dart';

class getAllReservationDetailsUseCase {
  final ResrvationRepositories resrvationRepositories;

  getAllReservationDetailsUseCase(this.resrvationRepositories);

  Future<Either<Failures, List<Reservation>>> call() async {
   return await resrvationRepositories.getAllReservationDetails();
  }
}
