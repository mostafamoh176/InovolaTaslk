import 'package:dartz/dartz.dart';
import 'package:inovolatask/core/errors/exception.dart';
import 'package:inovolatask/core/errors/failures.dart';
import 'package:inovolatask/core/shared/network.dart';
import 'package:inovolatask/feature/data/dataSources/reservRemoteDataSource.dart';
import 'package:inovolatask/feature/domain/entites/reservation.dart';
import 'package:inovolatask/feature/domain/repositories/reservation_repositories.dart';

class ReservationRepoImplement implements ResrvationRepositories {
  final ReservationRemoteDataSource reservationRemoteDataSource;
  final NetworkInfo networkInfo;

  ReservationRepoImplement({
    required this.reservationRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failures, List<Reservation>>> getAllReservationDetails() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteReservation =
            await reservationRemoteDataSource.getAllReservationData();
        return Right(remoteReservation);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
    throw UnimplementedError();
  }
}
