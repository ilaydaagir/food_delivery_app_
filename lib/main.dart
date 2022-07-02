import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/cubit/fiyathesapla_cubit.dart';
import 'package:food_delivery_app/cubit/sepet_cubit.dart';
import 'package:food_delivery_app/cubit/yemek_detay_cubit.dart';

import 'package:food_delivery_app/views/login.dart';

import 'cubit/anasayfa_cubit.dart';
import 'views/anasayfa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> YemekDetayCubit()),
        BlocProvider(create: (context)=>AnasayfaCubit()),
        BlocProvider(create: (context)=>FiyatHesaplaCubit()),
        BlocProvider(create: (context)=>SepetCubit()),

      ],
      child: MaterialApp(
         debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: GirisEkrani(),
      ),
    );
  }
}

