import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/cubit/fiyathesapla_cubit.dart';
import 'package:food_delivery_app/repo/sepet_yemekler_daorepo.dart';

class OdemeSayfasi extends StatefulWidget {
  String kullanici_adi;


  OdemeSayfasi(this.kullanici_adi);

  @override
  State<OdemeSayfasi> createState() => _OdemeSayfasiState();
}

class _OdemeSayfasiState extends State<OdemeSayfasi> {
  var fiyatRepo = SepetYemeklerDaoRepository();
  int toplamFiyat =0;
  @override
  void initState(){
    super.initState();
    fiyatRepo.fiyatHesapla(widget.kullanici_adi).then((value) {
      toplamFiyat = int.parse(value);
    });
    context.read<FiyatHesaplaCubit>().fiyatHesapla(widget.kullanici_adi);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Center(
  child: Text("$toplamFiyat"),
),
    );
  }
}
