import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/entity/yemekler.dart';

import 'package:food_delivery_app/repo/yemeklerdao_repository.dart';

class AnasayfaCubit extends Cubit<List<Yemekler>>{
  AnasayfaCubit() : super([]);

  var yrepo = YemeklerDaoRepository();


  Future<void> yemekleriYukle() async{
    var liste = await yrepo.tumYemekleriGetir();
    emit(liste);
  }

  Future<void> ara(String aramaKelimesi) async{
    var liste = await yrepo.yemeklerArama(aramaKelimesi);
    emit(liste);
  }


}