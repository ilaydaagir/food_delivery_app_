import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/repo/sepet_yemekler_daorepo.dart';

class FiyatHesaplaCubit extends Cubit<String>{
  FiyatHesaplaCubit():super("");

  var frepo = SepetYemeklerDaoRepository();
  Future<void> fiyatHesapla(String kullanici_adi) async{
    emit(await frepo.fiyatHesapla(kullanici_adi));
  }
}