import 'package:dio/dio.dart';
import 'package:inovolatask/core/errors/exception.dart';
import 'package:inovolatask/core/shared/constant.dart';
import 'package:inovolatask/core/shared/dioHelper.dart';
import 'package:inovolatask/feature/data/models/reservation_model.dart';
import 'package:intl/intl.dart';

abstract class ReservationRemoteDataSource {
  Future<List<ReservationModelData>> getAllReservationData();
}

class ReservRemoteDataSourceImp implements ReservationRemoteDataSource {
  @override
  Future<List<ReservationModelData>> getAllReservationData() async {
    Response? response;
    ReservationModelData? _reservationModel;
    List<ReservationModelData> resevationDataList = [];
    List<String> reservationImage = [];

    response = await DioHelper.getData(url: CommonUse.END_POINT);
    if (response.statusCode == 200) {
      _reservationModel = ReservationModelData.fromJson(response.data);
      resevationDataList.add(_reservationModel);
      _reservationModel.img.forEach((element) {
        reservationImage.add(element);
      });
      DateTime newDate = DateTime.parse("${_reservationModel.date}");
      print("${DateFormat.EEEE().format(newDate)}");
      return resevationDataList;
    } else {
      throw ServerException();
    }
  }
}
