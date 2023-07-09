import 'package:flutter/material.dart';
import 'package:uas_mob/pages/login_page.dart';
import 'package:uas_mob/pages/main_page.dart';

class SigninPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Form(
            key: _formKey,
            child: Container(
              margin: const EdgeInsets.only(top: 50),
              padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
              alignment: Alignment.center,
              child: Column(children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 50),
                  child: const Text(
                    'Daftar',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 1, horizontal: 10),
                      hintText: 'Masukan Nama',
                      hintStyle: const TextStyle(fontSize: 15),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tolong masukan nama anda';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 1, horizontal: 10),
                      hintText: 'Masukan Email',
                      hintStyle: const TextStyle(fontSize: 15),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tolong masukan email anda';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 1, horizontal: 10),
                      hintText: 'Masukan Password',
                      hintStyle: const TextStyle(fontSize: 15),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tolong masukan password anda';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 1, horizontal: 10),
                      hintText: 'Masukan ulang password',
                      hintStyle: const TextStyle(fontSize: 15),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tolong masukan password anda';
                    }
                    return null;
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainPage()));
                    },
                    child: const Text('Daftar'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.fromLTRB(92, 8, 92, 8)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Sudah punya akun?'),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.black),
                        ))
                  ],
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
