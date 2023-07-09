import 'package:flutter/material.dart';
import 'package:uas_mob/pages/main_page.dart';
import 'package:uas_mob/pages/signin_page.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _emailControler = TextEditingController();
  final _passControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Form(
            key: _formKey,
            child: Container(
              margin: EdgeInsets.only(top: 50),
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              alignment: Alignment.center,
              child: Column(children: [
                Container(
                  margin: EdgeInsets.only(bottom: 50),
                  child: Text(
                    'Login',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
                TextFormField(
                  controller: _emailControler,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                      hintText: 'Masukan Email',
                      hintStyle: TextStyle(fontSize: 15),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tolong masukan email anda';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _passControler,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                      hintText: 'Masukan Password',
                      hintStyle: TextStyle(fontSize: 15),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tolong masukan password anda';
                    }
                    return null;
                  },
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => MainPage()));
                    },
                    child: Text('Login'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: EdgeInsets.fromLTRB(92, 8, 92, 8)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Belum punya akun?'),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SigninPage()));
                        },
                        child: Text(
                          "Daftar",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ))
                  ],
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
