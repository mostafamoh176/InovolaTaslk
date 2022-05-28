import 'package:equatable/equatable.dart';
import 'package:inovolatask/feature/data/models/reservation_model.dart';

class Reservation extends Equatable {
final  int id;
final  String title;
final  List<String> img;
final  String interest;
final  int price;
final  String date;
final  String address;
final  String trainerName;
final String trainerImg;
final String trainerInfo;
final  String occasionDetail;
final  String latitude;
final  String longitude;
final  bool isLiked;
final  bool isSold;
final  bool isPrivateEvent;
final  bool hiddenCashPayment;
final  int specialForm;
final  Null questionnaire;
final  Null questExplanation;
final  List<ReservTypes>? reservTypes;

  Reservation(
      {required  this.id,
        required this.title,
        required this.img,
        required this.interest,
        required this.price,
        required this.date,
        required this.address,
        required this.trainerName,
        required this.trainerImg,
        required this.trainerInfo,
        required this.occasionDetail,
        required this.latitude,
        required this.longitude,
        required this.isLiked,
        required this.isSold,
        required this.isPrivateEvent,
        required this.hiddenCashPayment,
        required this.specialForm,
        required this.questionnaire,
        required this.questExplanation,
        required this.reservTypes,});

  @override
  List<Object?> get props => [
        id,
        title,
        img,
        interest,
        price,
        date,
        address,
        trainerName,
        trainerImg,
        trainerInfo,
        occasionDetail,
        latitude,
        longitude,
        isLiked,
        isSold,
        isPrivateEvent,
        hiddenCashPayment,
        specialForm,
        questionnaire,
        questExplanation,
        reservTypes,
      ];
}
