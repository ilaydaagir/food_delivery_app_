import 'package:flutter/material.dart';
import 'package:food_delivery_app/cubit/sepet_cubit.dart';
import 'package:food_delivery_app/cubit/yemek_detay_cubit.dart';
import 'package:food_delivery_app/entity/sepet_yemekler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/entity/yemekler.dart';
import 'package:food_delivery_app/views/sepet_sayfa.dart';


class YemekDetaySayfa extends StatefulWidget {
  String kullanici_adi;
  Yemekler yemek_tercih;


  YemekDetaySayfa(this.kullanici_adi, this.yemek_tercih);

  @override
  State<YemekDetaySayfa> createState() => _YemekDetaySayfaState();
}

class _YemekDetaySayfaState extends State<YemekDetaySayfa> {
  int adet =1;

  var tfYemekAdet = TextEditingController();

  @override
  void initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    var yemek = widget.yemek_tercih;
    tfYemekAdet.text = "0";
      return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Sepet(widget.kullanici_adi)));
            }, icon: Icon(Icons.shopping_basket))
          ],
          backgroundColor: Colors.black,
          title: Text(widget.yemek_tercih.yemek_adi,textAlign: TextAlign.center),
        ),
         body: Container(
           width: MediaQuery.of(context).size.width,
           height: MediaQuery.of(context).size.height,
           decoration: BoxDecoration(

               gradient: LinearGradient(colors: [
                 Color.fromRGBO(248, 238, 98, 1),
                 Color.fromRGBO(243, 215, 74, 1),
                 Color.fromRGBO(231, 169, 32, 1),
               ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),

           child: Center(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 Image.network("http://kasimadalan.pe.hu/yemekler/resimler/${yemek.yemek_resim_adi}"),
                 Text("${yemek.yemek_adi} : ${int.parse(yemek.yemek_fiyat)} ₺",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),


                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     ElevatedButton( style: ElevatedButton.styleFrom(primary: Colors.black),onPressed: (){
                       setState((){
                         adet -=1;
                       });

                     },
                         child: Text("-",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
                     ElevatedButton(
                         style: ElevatedButton.styleFrom(primary: Colors.black),onPressed: (){}, child: Text("Adet : $adet",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                     ElevatedButton( style: ElevatedButton.styleFrom(primary: Colors.black),onPressed: (){
                       setState((){
                      adet +=1;
                       });

                       }
                       ,  child: Text("+",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
                   ],
                 ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Toplam Fiyat : ${int.parse(yemek.yemek_fiyat)*adet} ₺",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ElevatedButton( style: ElevatedButton.styleFrom(primary: Colors.black),onPressed: (){


                  //int adet = int.parse(tfYemekAdet.text);
                  context.read<SepetCubit>().sepeteYemekEkle(yemek, widget.kullanici_adi, adet);
                }, child: Text("Sepete Ekle")),


              ],
            )
               ],
             ),
           ),
         ),
      );
  }
}
