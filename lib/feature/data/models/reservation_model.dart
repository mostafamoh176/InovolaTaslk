import 'package:inovolatask/feature/domain/entites/reservation.dart';

class ReservationModelData extends Reservation {
  ReservationModelData({
    required int id,
    required String title,
    required List<String> img,
    required String interest,
    required int price,
    required String date,
    required String address,
    required String trainerName,
    required String trainerImg,
    required String trainerInfo,
    required String occasionDetail,
    required String latitude,
    required String longitude,
    required bool isLiked,
    required bool isSold,
    required bool isPrivateEvent,
    required bool hiddenCashPayment,
    required int specialForm,
    required Null questionnaire,
    required Null questExplanation,
     List<ReservTypes>? reservTypes,

  }) : super(
    id: id,
    title: title,
    img: img,
    interest: interest,
    price: price,
    date: date,
    address: address,
    trainerName: trainerName,
    trainerImg: trainerImg,
    trainerInfo: trainerInfo,
    occasionDetail: occasionDetail,
    latitude: latitude,
    longitude: longitude,
    isLiked: isLiked,
    isSold: isSold,
    isPrivateEvent: isPrivateEvent,
    hiddenCashPayment: hiddenCashPayment,
    specialForm: specialForm,
    questionnaire: null,
    questExplanation: null,
    reservTypes: reservTypes,
  );


  factory ReservationModelData.fromJson(Map<String, dynamic> json) {
    final reservTypes = <ReservTypes>[];
    return ReservationModelData(
      id: json['id'],
      title: json['title'],
      img: json['img'].cast<String>(),
      interest: json["interest"],
      price: json['price'],
      date: json['date'],
      address: json['address'],
      trainerName: json['trainerName'],
      trainerImg: json['trainerImg'],
      trainerInfo: json['trainerInfo'],
      occasionDetail: json['occasionDetail'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      isLiked: json['isLiked'],
      isSold: json['isSold'],
      isPrivateEvent: json['isPrivateEvent'],
      hiddenCashPayment: json['hiddenCashPayment'],
      specialForm: json['specialForm'],
      questionnaire: json['questionnaire'],
      questExplanation: json['questExplanation'],
      reservTypes: json['reservTypes'].forEach((v) {
        reservTypes.add(new ReservTypes.fromJson(v));
      },),);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['img'] = this.img;
    data['interest'] = this.interest;
    data['price'] = this.price;
    data['date'] = this.date;
    data['address'] = this.address;
    data['trainerName'] = this.trainerName;
    data['trainerImg'] = this.trainerImg;
    data['trainerInfo'] = this.trainerInfo;
    data['occasionDetail'] = this.occasionDetail;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['isLiked'] = this.isLiked;
    data['isSold'] = this.isSold;
    data['isPrivateEvent'] = this.isPrivateEvent;
    data['hiddenCashPayment'] = this.hiddenCashPayment;
    data['specialForm'] = this.specialForm;
    data['questionnaire'] = this.questionnaire;
    data['questExplanation'] = this.questExplanation;
    if (this.reservTypes != null) {
      data['reservTypes'] = this.reservTypes?.map((v) => v.toJson()).toList();
    }
    return data;
  }

}

class ReservTypes {
  int? id;
  String? name;
  int? count;
  int? price;

  ReservTypes({this.id, this.name, this.count, this.price});

  ReservTypes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    count = json['count'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['count'] = this.count;
    data['price'] = this.price;
    return data;
  }
}
