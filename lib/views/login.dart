import 'package:flutter/material.dart';
import 'package:food_delivery_app/views/anasayfa.dart';
import 'package:food_delivery_app/views/yemekler_sayfa.dart';

class GirisEkrani extends StatefulWidget {
  const GirisEkrani({Key? key}) : super(key: key);

  @override
  State<GirisEkrani> createState() => _GirisEkraniState();
}

class _GirisEkraniState extends State<GirisEkrani> {
  var tfkullanici_adi =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              logoWidget("assets/logo.png"),
              Padding(
                padding: const EdgeInsets.only(right: 20,left: 20),
                child: TextField(
                  controller: tfkullanici_adi,
                  decoration: InputDecoration(
                    hintText: "Kullanici Adi"
                  ),
                ),
              ),
              SizedBox(height: 100),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.black),onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>YemeklerSayfa(tfkullanici_adi.text)));
              },
                  child: Text("Kaydet"))
            ],
          ),
        ),
      ),

    );
  }
}
Image logoWidget(String imageName) {
  return Image.asset(imageName, fit: BoxFit.fitWidth, width: 250, height: 250);
}