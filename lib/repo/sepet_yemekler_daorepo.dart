import 'dart:convert';

import 'package:food_delivery_app/entity/yemekler.dart';

import '../entity/sepet_yemekler.dart';
import '../entity/sepet_yemekler_cevap.dart';
import 'package:http/http.dart' as http;

class  SepetYemeklerDaoRepository{
  List<SepetYemekler> parseSepetYemeklerCevap(String cevap){
    return SepetYemeklerCevap.fromJson(json.decode(cevap)).sepet_yemekler;
  }

  Future<List<SepetYemekler>> sepettekiYemekleriGetir(String kullanici_adi) async{
    var url = Uri.parse("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php");
    var veri = {"kullanici_adi":kullanici_adi};
    var cevap = await http.post(url, body: veri);
    return parseSepetYemeklerCevap(cevap.body);
  }

  Future<void> sepeteYemekEkle(Yemekler yemek,String kullanici_adi, int yemek_siparis_adet) async{
    var url = Uri.parse("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php");
    var veri = {
      "yemek_adi":yemek.yemek_adi,
    "yemek_resim_adi":yemek.yemek_resim_adi,
    "yemek_fiyat":yemek.yemek_fiyat,
    "yemek_siparis_adet":yemek_siparis_adet,
    "kullanici_adi":kullanici_adi};
    var cevap = await http.post(url, body: veri);

  }
  Future<void> sepettenYemekSil(int sepet_yemek_id, String kullanici_adi) async{
    var url = Uri.parse("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php");
    var veri = {
      "kullanici_adi":kullanici_adi,
     "sepet_yemek_id":sepet_yemek_id};
      var cevap = await http.post(url, body: veri);

  }
  Future<String> fiyatHesapla(String kullanici_adi)async{
    var url = Uri.parse("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php");
    var veri = {
      "kullanici_adi":kullanici_adi};
    var cevap = await http.post(url, body: veri);

    List<SepetYemekler> sepet = parseSepetYemeklerCevap(cevap.body);
    int sayac = 0;
    int toplamFiyat = 0;

    for(int i =0;i<sepet.length;i++){
      int fiyat = int.parse(sepet[i].yemek_fiyat);
      int adet = int.parse(sepet[i].yemek_siparis_adet);

      toplamFiyat = toplamFiyat + fiyat*adet;
    }
    return "$toplamFiyat";
  }
}