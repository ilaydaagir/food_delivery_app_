import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/entity/yemekler_cevap.dart';
import 'package:food_delivery_app/views/yemek_detay_sayfa.dart';

import '../cubit/anasayfa_cubit.dart';
import '../entity/mesajlar.dart';
import '../entity/sepet_yemekler.dart';
import '../entity/yemekler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class Anasayfa extends StatefulWidget {
  String kullanici_adi;


  Anasayfa(this.kullanici_adi);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool aramaYapiliyorMu = false;


  @override
  void initState(){
    super.initState();
    context.read<AnasayfaCubit>().yemekleriYukle();

  }


  @override
  Widget build(BuildContext context) {

      return Scaffold(
        appBar: AppBar(

        ),
        body: BlocBuilder<AnasayfaCubit,List<Yemekler>>(
          builder: (context,yemeklerListesi) {
            if(yemeklerListesi.isNotEmpty) {
              return ListView.builder(
                  itemCount: yemeklerListesi.length,
                  itemBuilder: (context, indeks) {
                    var yemek_tercih = yemeklerListesi[indeks];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>
                                YemekDetaySayfa(widget.kullanici_adi, yemek_tercih))).then((value) {
                          context.read<AnasayfaCubit>().yemekleriYukle();
                        });
                      },
                      child: Card(
                        child: Row(
                          children: [
                            Text("${yemek_tercih.yemek_adi}"),
                            Text("${yemek_tercih.yemek_fiyat}")
                          ],
                        ),
                      ),
                    );
                  }

              );
            }
          else{
            return Center();
            }
            }),
      );
  }
}
