import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/cubit/sepet_cubit.dart';
import 'package:food_delivery_app/entity/yemekler_cevap.dart';
import 'package:food_delivery_app/views/%C3%B6deme_sayfasi.dart';
import 'package:food_delivery_app/views/yemek_detay_sayfa.dart';

import '../cubit/anasayfa_cubit.dart';

import '../entity/sepet_yemekler.dart';



class Sepet extends StatefulWidget {
  String kullanici_adi;


  Sepet(this.kullanici_adi);

  @override
  State<Sepet> createState() => _SepetState();
}

class _SepetState extends State<Sepet> {


  @override
  void initState(){
    super.initState();
    context.read<SepetCubit>().sepettekiYemeklerigetir(widget.kullanici_adi);
    print("yemekler yüklendi");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
            title: Text("Sepet",style: TextStyle(color: Colors.white),
                ),),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(

              gradient: LinearGradient(colors: [
                Color.fromRGBO(248, 238, 98, 1),
                Color.fromRGBO(243, 215, 74, 1),
                Color.fromRGBO(231, 169, 32, 1),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),

          child: BlocBuilder<SepetCubit,List<SepetYemekler>>(
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
                                    OdemeSayfasi(widget.kullanici_adi))).then((value) {
                              context.read<AnasayfaCubit>().yemekleriYukle();
                            });
                          },
                          child: Card(
                            color: Colors.orange,
                            child: Row(
                              children: [


                                Container(

                                  child: Image.network("http://kasimadalan.pe.hu/yemekler/resimler/${yemek_tercih.yemek_resim_adi}"),
                                ),

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
                return Center(
                  child: Text("Kullanici Adi :${widget.kullanici_adi}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                );
                }
                }),
        )
    );
  }
}
