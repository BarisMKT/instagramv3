import 'package:flutter/material.dart';

class GirisSayfasi extends StatefulWidget {
  @override
  _GirisSayfasiState createState() => _GirisSayfasiState();
}

class _GirisSayfasiState extends State<GirisSayfasi> {
  final _formAnahtari = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formAnahtari,
      child: ListView(
        padding: EdgeInsets.only(left: 20, right: 20, top: 60),
        children: [
          FlutterLogo(
            size: 90,
          ),
          SizedBox(
            height: 80,
          ),
          TextFormField(
            autocorrect: true,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: "Email adresinizi girin",
                errorStyle: TextStyle(fontSize: 14),
                prefixIcon: Icon(Icons.mail)),
                validator: (girilenDeger){
                  if(girilenDeger.isEmpty){
                    return "Bu alan boş bırakılamaz";
                  }
                  else if(!girilenDeger.contains("@")){
                    return "Girilen değer mail formatında olmalı";
                  }
                  return null;
                },
          ),
          SizedBox(
            height: 40,
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Şifrenizi girin",
              errorStyle: TextStyle(fontSize: 14),
              prefixIcon: Icon(
                Icons.lock_outline_rounded,
              ),
            ),
            validator: (girilenDeger){
                  if(girilenDeger.isEmpty){
                    return "Bu alan boş bırakılamaz";
                  }
                  else if(girilenDeger.trim().length < 8){
                    return "Şifre 8 karakterden az olamaz";
                  }
                  return null;
                },
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Expanded(
                child: FlatButton(
                  onPressed: () {},
                  child: Text(
                    "Hesap Oluştur",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: FlatButton(
                  onPressed: _girisYap,
                  child: Text(
                    "Giriş Yap",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  color: Theme.of(context).primaryColor,
                ),
              )
            ],
          ),
          SizedBox(height:16),
          Center(child: Text("veya")),
          SizedBox(height:16),
          Center(child: Text("Google ile Giriş Yap",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey[600]),)),
          SizedBox(height:16),
          Center(child: Text("Şifremi Unuttum")),
        ],
      ),
    ));
  }

  void _girisYap() {
    if(_formAnahtari.currentState.validate()){
      print("Giriş yapılıyor");
    }
  }
}
