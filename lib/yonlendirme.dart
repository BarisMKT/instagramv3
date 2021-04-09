import 'package:flutter/material.dart';
import 'package:instagram/modeller/kullanici.dart';
import 'package:instagram/sayfalar/anasayfa.dart';
import 'package:instagram/sayfalar/girissayfasi.dart';
import 'package:instagram/servisler/yetkilendirmeservisi.dart';

class Yonlendirme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: YetkilendirmeServisi().durumTakipcisi,
      builder: (context,snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        if(snapshot.hasData){
          Kullanici aktifKullanici = snapshot.data;
          return AnaSayfa();
        } else{
          return GirisSayfasi();
        }
      });
  }
}