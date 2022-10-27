import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handphoneokik/Model/handphone.dart';

class detailHanphonePage extends StatefulWidget {
  detailHanphonePage({required this.handphone});
  final Handphone handphone;

  @override
  detailHanphonePageState createState() => detailHanphonePageState();
}

class detailHanphonePageState extends State<detailHanphonePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.handphone.nama),
      ),
      body: Container(
        width: double.infinity,
        child: ListView(
          children: [
            Image.network(widget.handphone.foto),
            Container(
              padding: EdgeInsets.all(5),
              decoration: new BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [const Color(0xff3164bd), const Color(0xff295cb5)],
                ),
              ),
              child: Text(
                widget.handphone.nik,
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.lightBlue,
              width: double.infinity,
              height: double.maxFinite,
              child: new Text(widget.handphone.alamat),
            ),
          ],
        ),
      ),
    );
  }
}
