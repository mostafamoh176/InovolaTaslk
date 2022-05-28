import 'package:dartz/dartz.dart';
import 'package:inovolatask/core/errors/failures.dart';
import 'package:inovolatask/feature/domain/entites/reservation.dart';

abstract class ResrvationRepositories{
Future<Either<Failures,List<Reservation>>> getAllReservationDetails();
}
