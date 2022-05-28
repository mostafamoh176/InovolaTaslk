import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inovolatask/core/errors/Strings.dart';
import 'package:inovolatask/core/errors/failures.dart';
import 'package:inovolatask/core/shared/constant.dart';
import 'package:inovolatask/core/shared/dioHelper.dart';
import 'package:inovolatask/feature/data/models/reservation_model.dart';
import 'package:inovolatask/feature/domain/entites/reservation.dart';
import 'package:inovolatask/feature/domain/useCases/get_all_reservation.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'reservation_state.dart';

class ReservationCubit extends Cubit<ReservationState> {
  ReservationCubit(this.getAllReservUseCase) : super(ReservationInitial());

  static ReservationCubit get(context) => BlocProvider.of(context);

  final getAllReservationDetailsUseCase getAllReservUseCase;
  DateTime? newDate;
  String? dateNow;
  String? timeNow;
  int? dateObj;
  String? dateStr;
  String? editedTime;
  bool pm = false;

  getDate(String date) {
    switch (date) {
      case "Saturday":
        return "السبت";
      case "Sunday":
        return "الأحد";
      case "Monday":
        return "الاثنين";
      case "TuesDay":
        return "الثلاثاء";
      case "Wednesday":
        return "الأربعاء";
      case "Thursday":
        return "الخميس";
      case "Friday":
        return "الجمعه";
    }
  }

  String? dateName;
  int? monthNum;
  getMonth(int num) {
    switch (num) {
      case 1:
        return "كانون الثاني";
      case 2:
        return "شباط";
      case 3:
        return " آذار";
      case 4:
        return "نيسان";
      case 5:
        return "أيار";
      case 6:
        return " حزيران";
      case 7:
        return "تموز";
      case 8:
        return "آب";
      case 9:
        return "أيلول";
      case 10:
        return "تشرين الأول";
      case 11:
        return "تشرين الثاني";
      case 12:
        return "كانون الأول";
    }
  }

  String? monthName;

  getAllReservData() async {
    final failureOrReservData = await getAllReservUseCase();
    failureOrReservData.fold((failure) {
      emit(ErrorGetReservationState(message: _mapFailureToMessage(failure)));
    }, (resrvData) {
      newDate = DateTime.parse("${resrvData[0].date}");
      dateNow = DateFormat('EEEE').format(newDate!);
      dateName = getDate(dateNow!);
      monthName = timeNow = DateFormat('h:mm a').format(newDate!);
      if (timeNow!.contains("P")) {
        timeNow!.split(" مساءاَ");
        pm = true;
        editedTime = timeNow!.substring(0, 4);
      }
      dateStr = resrvData[0].date;
      dateObj=DateTime.parse(dateStr!).day;
      monthNum= DateTime.parse(dateStr!).month;
      monthName=getMonth(monthNum!);
      emit(SuccessGetReservationState(reservation: resrvData));
    });
  }

  String _mapFailureToMessage(Failures failures) {
    switch (failures.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "UnExpacted Error, Please try again latter";
    }
  }
}
