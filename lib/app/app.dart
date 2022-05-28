import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:inovolatask/core/shared/constant.dart';
import 'package:inovolatask/core/shared/network.dart';
import 'package:inovolatask/feature/data/dataSources/reservRemoteDataSource.dart';
import 'package:inovolatask/feature/data/repositories/reserv_repo_implement.dart';
import 'package:inovolatask/feature/domain/useCases/get_all_reservation.dart';
import 'package:inovolatask/feature/presentation/reservation_business_logic/reservationCubit/reservation_cubit.dart';
import 'package:inovolatask/feature/presentation/views/view.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ReservationCubit(
        getAllReservationDetailsUseCase(
          ReservationRepoImplement(
            networkInfo: NetwrokInfoImple(InternetConnectionChecker()),
            reservationRemoteDataSource: ReservRemoteDataSourceImp(),
          ),
        ),
      )..getAllReservData(),
      child: MaterialApp(
        useInheritedMediaQuery: true,
        debugShowCheckedModeBanner: false,
        home: ScreenUtilInit(
          designSize: const Size(DifferenSize.appWidth, DifferenSize.appHeight),
          builder: (BuildContext context, Widget? child) => MainScreen(),
        ),
      ),
    );
  }
}
