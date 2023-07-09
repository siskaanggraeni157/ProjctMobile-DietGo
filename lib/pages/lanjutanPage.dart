import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:uas_mob/pages/doingOlahraga/doingOlahragaLanjutan.dart';
import 'package:uas_mob/pages/main_page.dart';

class LanjutanPage extends StatefulWidget {
  const LanjutanPage({super.key});

  @override
  State<LanjutanPage> createState() => _LanjutanPageState();
}

class _LanjutanPageState extends State<LanjutanPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    List<Olahraga> olahraga = [
      Olahraga(nama: "push up", jumlah: "x30"),
      Olahraga(nama: "incline push up", jumlah: "x30"),
      Olahraga(nama: "decline push up", jumlah: "x30"),
      Olahraga(nama: "squat", jumlah: "x50"),
      Olahraga(nama: "sit up", jumlah: "x50"),
      Olahraga(nama: "back extension", jumlah: "x20"),
      Olahraga(nama: "pull up", jumlah: "x10"),
      Olahraga(nama: "plank", jumlah: "30 detik"),
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: const Image(
          image: AssetImage("assets/images/diet4.jpg"),
          fit: BoxFit.cover,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const MainPage()));
          },
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Container(
            margin: const EdgeInsets.only(bottom: 20, left: 20),
            alignment: Alignment.centerLeft,
            child: const Text(
              "OLAHRAGA LANJUTAN",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
        ),
      ),
      body: FooterView(
          footer: Footer(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: const Size.fromHeight(50),
                    shape: const StadiumBorder()),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DoingOlahragaLanjutan()));
                },
                child: const Text("Mulai"),
              )),
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    width: width,
                    padding: const EdgeInsets.only(bottom: 10),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.black, width: 1))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 5,
                          height: 20,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("40 Menit",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "8 Latihan",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: olahraga.map((studentone) {
                return Card(
                    child: ListTile(
                  title: Text(studentone.nama!),
                  subtitle: Text(studentone.jumlah!),
                ));
              }).toList(),
            )
          ]),
    );
  }
}

class Olahraga {
  String? nama;
  String? jumlah;

  Olahraga({required String this.nama, required String this.jumlah});
}
