import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/entity/yemekler.dart';

import 'package:food_delivery_app/repo/sepet_yemekler_daorepo.dart';
import 'package:food_delivery_app/repo/yemeklerdao_repository.dart';

import '../entity/sepet_yemekler.dart';

class SepetCubit extends Cubit<List<SepetYemekler>>{
  SepetCubit():super(<SepetYemekler>[]);

  var yrepo = SepetYemeklerDaoRepository();


  Future<void> sepeteYemekEkle(Yemekler yemek, String kullanici_adi, int yemek_siparis_adet) async{
    await yrepo.sepeteYemekEkle(yemek,kullanici_adi,yemek_siparis_adet);

  }
  Future<void> sepettekiYemeklerigetir(String kullanici_adi) async{
    var liste = await yrepo.sepettekiYemekleriGetir(kullanici_adi);
    emit(liste);
  }

  Future<void> sil(int sepet_yemek_id,String kullanici_adi) async{
    await yrepo.sepettenYemekSil(sepet_yemek_id, kullanici_adi);
  }
}