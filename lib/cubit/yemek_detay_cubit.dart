import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/repo/yemeklerdao_repository.dart';

class YemekDetayCubit extends Cubit<void>{
  YemekDetayCubit():super(0);

var yrepo = YemeklerDaoRepository();
  Future<void> yemekEkle(String yemek_adi, String yemek_resim_adi, int yemek_fiyat, int yemek_siparis_adet,String kullanici_adi) async{



  }

}