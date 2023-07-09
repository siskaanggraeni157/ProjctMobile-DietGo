import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

enum Gender { male, female }

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController dateinput = TextEditingController();

  Gender? _gender = Gender.male;

  get prefs => null;

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    getActualData();
    super.initState();
  }

  final _formKey = GlobalKey<FormState>(); // global form key

  // controler for formfield
  final conName = TextEditingController();
  final conEmail = TextEditingController();
  final conWeight = TextEditingController();
  final conHeight = TextEditingController();
  final conDob = TextEditingController();
  final conPob = TextEditingController();
  final conGender = TextEditingController();

  // user input data
  String unama = '';
  String uemail = '';
  String uweight = '';
  String uheight = '';
  String udob = '';
  String upob = '';
  String ugender = '';

  String dnama = '';
  String demail = '';
  String dweight = '';
  String dheight = '';
  String ddob = '';
  String dpob = '';
  String dgender = '';

  void sharedPrefInit() async {
    try {
      /// Checks if shared preference exist
      Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
      final SharedPreferences prefs = await _prefs;
      prefs.getString("app-name");
    } catch (err) {
      /// setMockInitialValues initiates shared preference
      /// Adds app-name
      SharedPreferences.setMockInitialValues({});
      Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
      final SharedPreferences prefs = await _prefs;
      prefs.setString("app-name", "my-app");
    }
  }

  // add data
  dynamic setString(key, val) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    var _res = prefs.setString("$key", val);
    return _res;
  }

  // get data
  dynamic getString(key) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    String? _res = prefs.getString("$key");
    return _res;
  }

  // Crud Function
  Future<void> addUser(String nama, String email, String weight, String height,
      String pob, String dob, String gender) async {
    final prefs = await SharedPreferences.getInstance();
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
    // getData();
    // setState(() {
    // });
    dnama = nama;
    demail = email;
    dweight = weight;
    dheight = height;
    ddob = dob;
    dpob = pob;
    dgender = gender;

    setState(() {
      // unama = (prefs.getString('nama'));
      prefs.setString('nama', dnama);

      // uemail = (prefs.getString('uemail'));
      prefs.setString('email', demail);

      // uweight = (prefs.getString('uweight'));
      prefs.setString('weight', dweight);

      // uheight = (prefs.getString('uheight'));
      prefs.setString('height', dheight);

      // udob = (prefs.getString('udob'));
      prefs.setString('dob', ddob);

      // upob = (prefs.getString('upob'));
      prefs.setString('pob', dpob);

      // ugender = (prefs.getString('ugender'));
      prefs.setString('gender', dgender);
    });
  }

  // getData() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     unama = (prefs.getString('nama') ?? '');
  //     uemail = (prefs.getString('email') ?? '');
  //     uweight = (prefs.getString('weight') ?? '');
  //     uheight = (prefs.getString('height') ?? '');
  //     udob = (prefs.getString('dob') ?? '');
  //     upob = (prefs.getString('pob') ?? '');
  //     ugender = (prefs.getString('gender') ?? '');
  //   });
  // }

  getActualData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      dnama = prefs.getString('nama') ?? '';
      demail = prefs.getString('email') ?? '';
      dweight = prefs.getString('weight') ?? '';
      dheight = prefs.getString('height') ?? '';
      ddob = prefs.getString('dob') ?? '';
      dpob = prefs.getString('pob') ?? '';
      dgender = prefs.getString('gender') ?? '';
    });
  }

  Future<void> editUser(String nama, String email, String weight, String height,
      String pob, String dob, String gender) async {
    conName.text = nama;
    conEmail.text = email;
    conWeight.text = weight;
    conHeight.text = height;
    conDob.text = dob;
    conPob.text = pob;
    conGender.text = gender;
  }

  clearPage() {
    conName.text = '';
    conEmail.text = '';
    conWeight.text = '';
    conHeight.text = '';
    conDob.text = '';
    conPob.text = '';
    conGender.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        title: const Text('Profile Page'),
        actions: [
          // IconButton(onPressed: () {}, icon: const Icon(Icons.edit_note)),
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        scrollable: true,
                        title: const Text('Add Data'),
                        content: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  controller: conName,
                                  decoration: const InputDecoration(
                                    labelText: 'Nama',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your name';
                                    }
                                  },
                                ),
                                TextFormField(
                                  controller: conEmail,
                                  decoration: const InputDecoration(
                                    labelText: 'Email',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                  },
                                ),
                                TextFormField(
                                  controller: conWeight,
                                  decoration: const InputDecoration(
                                    labelText: 'weight',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your weight';
                                    }
                                  },
                                ),
                                TextFormField(
                                  controller: conHeight,
                                  decoration: const InputDecoration(
                                    labelText: 'height',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your height';
                                    }
                                  },
                                ),
                                TextFormField(
                                  controller:
                                      dateinput, //editing controller of this TextField
                                  decoration: const InputDecoration(
                                      labelText:
                                          "Date of Birthday" //label text of field
                                      ),
                                  readOnly:
                                      true, //set it true, so that user will not able to edit text
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(
                                            2000), //DateTime.now() - not to allow to choose before today.
                                        lastDate: DateTime(2101));

                                    if (pickedDate != null) {
                                      //pickedDate output format => 2021-03-10 00:00:00.000
                                      String formattedDate =
                                          DateFormat('yyyy-MM-dd')
                                              .format(pickedDate);
                                      //formatted date output using intl package =>  2021-03-16
                                      //you can implement different kind of Date Format here according to your requirement

                                      setState(() {
                                        dateinput.text =
                                            formattedDate; //set output date to TextField value.
                                      });
                                    } else {}
                                  },
                                ),
                                TextFormField(
                                  controller: conPob,
                                  decoration: const InputDecoration(
                                    labelText: 'Place of Birthday',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your birthday';
                                    }
                                  },
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListTile(
                                      title: const Text('Male'),
                                      leading: Radio<Gender>(
                                        value: Gender.male,
                                        groupValue: _gender,
                                        onChanged: (Gender? value) {
                                          setState(() {
                                            _gender = value;
                                          });
                                        },
                                      ),
                                    ),
                                    ListTile(
                                      title: const Text('Female'),
                                      leading: Radio<Gender>(
                                        value: Gender.female,
                                        groupValue: _gender,
                                        onChanged: (Gender? value) {
                                          setState(() {
                                            _gender = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        actions: [
                          TextButton(
                              child: const Text("Submit"),
                              onPressed: () {
                                setState(() {
                                  getActualData();
                                  addUser(
                                      conName.text,
                                      conEmail.text,
                                      conWeight.text,
                                      conHeight.text,
                                      conPob.text,
                                      dateinput.text,
                                      conGender.text);
                                });
                                Navigator.pop(context);
                              }),
                          TextButton(
                              onPressed: () {
                                clearPage();
                                Navigator.pop(context);
                              },
                              child: const Text("Cancel"))
                        ],
                      );
                    });
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 50),
            alignment: Alignment.center,
            child: Column(
              children: [
                // ignore: prefer_const_constructors
                Image(
                  // ignore: prefer_const_constructors
                  image: AssetImage(
                      'assets/images/blank-profile-picture-gfd0b36f52_1280.png'),
                  width: 200,
                  height: 200,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(dnama),
                const SizedBox(
                  height: 5,
                ),
                Text(demail)
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.80,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [const Text("Weight"), Text(dweight)],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [const Text('Height'), Text(dheight)],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [const Text('Date of Birthday'), Text(ddob)],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [const Text('Place of Birthday'), Text(dpob)],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [const Text('Gender'), Text("${_gender?.name}")],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
