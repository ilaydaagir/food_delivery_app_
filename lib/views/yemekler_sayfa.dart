import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/cubit/anasayfa_cubit.dart';
import 'package:food_delivery_app/entity/yemekler.dart';
import 'package:food_delivery_app/views/yemek_detay_sayfa.dart';

class YemeklerSayfa extends StatefulWidget {
  String kullanici_adi;


  YemeklerSayfa(this.kullanici_adi);

  @override
  State<YemeklerSayfa> createState() => _YemeklerSayfaState();
}

class _YemeklerSayfaState extends State<YemeklerSayfa> {
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
        actions: [
          aramaYapiliyorMu ?
          IconButton(
              onPressed: (){
                setState((){
                  context.read<AnasayfaCubit>().yemekleriYukle();
                });
              },
              icon: const Icon(Icons.clear))
              :
          IconButton(
              onPressed: (){
                setState((){
                  aramaYapiliyorMu = true;
                });
              },
              icon: const Icon(Icons.search))
        ],
        title: aramaYapiliyorMu ?
        TextField(
          style: TextStyle(color: Colors.white),
            decoration: InputDecoration(hintText: "Ara"),
            onChanged: (aramaSonucu){
              context.read<AnasayfaCubit>().ara(aramaSonucu);
            }) :
        Text("Yemekler",style: TextStyle(color: Colors.white)),

        backgroundColor: Colors.black,
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

        child: BlocBuilder<AnasayfaCubit,List<Yemekler>>(builder: (context,yemeklerListesi) {
        if (yemeklerListesi.isNotEmpty) {
          return ListView.builder(

              itemCount: yemeklerListesi.length,
              itemBuilder: (context, indeks) {
                var yemek = yemeklerListesi[indeks];
                return GestureDetector(

                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>
                            YemekDetaySayfa(widget.kullanici_adi, yemek)));
                  },
                  child: SizedBox(
                    height: 300,
                    child: Card(
                      color: Colors.white54.withOpacity(0.2),
                      child: Row(
                        children: [
                         Container(

                            child: Image.network("http://kasimadalan.pe.hu/yemekler/resimler/${yemek.yemek_resim_adi}"),
                          ),
                          SizedBox(width: 20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("${yemek.yemek_adi}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              Text("${yemek.yemek_fiyat} ₺",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                            ],
                          )

                        ],
                      ),
                    ),
                  ),
                );
              });
        }else{
          return Center();
        }
          }),
      ),
    );
  }
  }

/*Container(
height: 300,
decoration: BoxDecoration(
image: DecorationImage(
fit: BoxFit.fill,
image: NetworkImage(
"http://kasimadalan.pe.hu/yemekler/resimler/${yemek.yemek_resim_adi}"),
),
),

),
*/