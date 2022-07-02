import 'package:food_delivery_app/entity/yemekler.dart';

class YemeklerCevap{
  List<Yemekler> yemekler;
  int success;

  YemeklerCevap({required this.yemekler,required this.success});


  factory YemeklerCevap.fromJson(Map<String, dynamic> json){
    var jsonArray = json["yemekler"] as List;
    List<Yemekler> yemeklerListesi = jsonArray.map((jsonArrayNesnesi) => Yemekler.fromJson(jsonArrayNesnesi)).toList();



    return YemeklerCevap(yemekler: yemeklerListesi, success: json["success"] as int);

  }

}