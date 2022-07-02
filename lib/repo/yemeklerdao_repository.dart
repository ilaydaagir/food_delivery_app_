import 'dart:convert';

import 'package:food_delivery_app/entity/sepet_yemekler.dart';
import 'package:food_delivery_app/entity/yemekler.dart';
import 'package:food_delivery_app/entity/yemekler_cevap.dart';
import 'package:food_delivery_app/views/sepet_sayfa.dart';
import 'package:http/http.dart' as http;

import '../entity/sepet_yemekler_cevap.dart';

class YemeklerDaoRepository{

  List<Yemekler> parseYemeklerCevap(String cevap){
    return YemeklerCevap.fromJson(json.decode(cevap)).yemekler;
  }

 Future<List<Yemekler>> tumYemekleriGetir() async{
 var url = Uri.parse("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php");
 var cevap = await http.get(url);
 return parseYemeklerCevap(cevap.body);
 }


  Future<List<Yemekler>> yemeklerArama(String aramaKelimesi) async{
    var url = Uri.parse("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php");
    var cevap = await http.get(url);
    var yemek = parseYemeklerCevap(cevap.body);
    
    return yemek.where((element) => element.yemek_adi.contains(aramaKelimesi)).toList();
  }




}