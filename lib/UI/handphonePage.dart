import 'package:flutter/material.dart';
import 'package:handphoneokik/Model/handphone.dart';
import 'package:handphoneokik/Model/handphonePage.dart';
import 'package:handphoneokik/Services/apiStatic.dart';
import 'package:handphoneokik/UI/detailHandphone.dart';
import 'package:handphoneokik/UI/homePage.dart';

class handphonePage extends StatefulWidget {
  @override
  handphonePageState createState() => handphonePageState();
}

class handphonePageState extends State<handphonePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("daftar hanphone"),
      ),
      body: FutureBuilder<List<Handphone>>(
        future: ApiStatic.getHandphone(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<Handphone> listHandphone = snapshot.data!;
            return Container(
              padding: EdgeInsets.all(5),
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) => Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext contect) =>
                                detailHanphonePage(
                                  handphone: listHandphone[index],
                                )));
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.only(top: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Colors.white,
                            border: Border.all(
                                width: 1, color: Colors.lightGreenAccent)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.network(
                              listHandphone[index].foto,
                              width: 30,
                            ),
                            Column(
                              children: [
                                Text(listHandphone[index].nama),
                                Text(
                                  listHandphone[index].namaKelompok,
                                  style: TextStyle(fontSize: 8),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 1,
        backgroundColor: Colors.purpleAccent,
        onTap: (i) {
          switch (i) {
            case 0:
              Navigator.of(context).pushReplacement(new MaterialPageRoute(
                  builder: (BuildContext contect) => HomePage()));
              break;
            case 1:
              Navigator.of(context).pushReplacement(new MaterialPageRoute(
                  builder: (BuildContext contect) => handphonePage()));
              break;
            default:
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle),
              title: Text("Handphone")),
        ],
      ),
    );
  }
}
