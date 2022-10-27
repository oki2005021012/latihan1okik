import 'package:handphoneokik/Model/handphone.dart';
import 'package:handphoneokik/Model/handphone.dart';

class ApiStatic {
  static Future<List<Handphone>> getHandphone() async {
    List<Handphone> handphone = [];
    for (var i = 0; i < 10; i++) {
      handphone.add(Handphone(
          idPenjual: i,
          nama: "Nama Handphone" + i.toString(),
          nik: "123" + i.toString(),
          alamat:
              "Dengan Kamu mengunjungi situs ini kamu dapat melihat berbagai hanphone yang sedang ngetrend di tahun di 2022",
          telp: "081234667859",
          foto:
              "https://assets.promediateknologi.com/crop/0x0:0x0/x/photo/2022/03/31/950962144.jpg",
          idKelompokTani: 1,
          status: "Y",
          namaKelompok: "Okik Phone",
          createAt: "",
          updateAt: ""));
    }
    return handphone;
  }
}
