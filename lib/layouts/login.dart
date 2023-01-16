// ignore_for_file: avoid_unnecessary_containers
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:module3_layout_and_navigation/layouts/home.dart';
import 'package:module3_layout_and_navigation/services/list_users_services.dart';
import 'package:responsive_framework/responsive_framework.dart';

AlertDialog alertAndroid = AlertDialog(
  title: Text('Masukan Anda Salah!!'),
  content: Text('Silahkan Masukan Data yang Benar'),
);
CupertinoAlertDialog alertIOS = CupertinoAlertDialog(
  title: Text('Masukan Anda Salah!!'),
  content: Text('Silahkan Masukan Data yang Benar'),
);

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String username = 'naww';
  String password = '87';

  final TextEditingController usernameController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  postLogin(String username, String password) async {
    ListUsersService _service = ListUsersService();
    await _service.postLogin(username, password);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: const Color(0xFF1a247f),
          title: Center(
            child: Text(
              "Koperasi Undiksha",
              style: TextStyle(
                fontSize: ResponsiveValue(context,
                    defaultValue: 20.0,
                    valueWhen: const [
                      Condition.largerThan(name: MOBILE, value: 22.0),
                      Condition.largerThan(name: TABLET, value: 25.0)
                    ]).value,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Image.asset(
                  'images/LOGO UNDIKSHA.png',
                  scale: 1.6,
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFF1a227f),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 12,
                            ),
                            child: Text(
                              'Username:',
                              style: TextStyle(
                                fontSize: ResponsiveValue(context,
                                    defaultValue: 20.0,
                                    valueWhen: const [
                                      Condition.largerThan(
                                          name: MOBILE, value: 22.0),
                                      Condition.largerThan(
                                          name: TABLET, value: 25.0)
                                    ]).value,
                              ),
                            ),
                          ),
                          Container(
                            child: TextFormField(
                              controller: usernameController,
                              decoration: InputDecoration(
                                hintText: 'Masukan username',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 12,
                            ),
                            child: Text(
                              'Password: ',
                              style: TextStyle(
                                fontSize: ResponsiveValue(context,
                                    defaultValue: 20.0,
                                    valueWhen: const [
                                      Condition.largerThan(
                                          name: MOBILE, value: 22.0),
                                      Condition.largerThan(
                                          name: TABLET, value: 25.0)
                                    ]).value,
                              ),
                            ),
                          ),
                          Container(
                            child: TextFormField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Masukan password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 50,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFF1a247f),
                          shadowColor: Colors.black,
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                        onPressed: () {
                          // if (usernameController.text == username &&
                          //     passwordController.text == password) {
                          //   Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => Home(),
                          //     ),
                          //   );
                          postLogin(
                              usernameController.text, passwordController.text);
                          if (postLogin(usernameController.text,
                                  passwordController.text) !=
                              null) {
                            print(usernameController.text);
                            print(passwordController.text);
                            // print(usernameController.text);
                            // print(usernameController.text);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Home(),
                              ),
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                if (defaultTargetPlatform ==
                                    TargetPlatform.iOS) {
                                  return alertIOS;
                                } else {
                                  return alertAndroid;
                                }
                              },
                            );
                          }
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: ResponsiveValue(context,
                                defaultValue: 14.0,
                                valueWhen: const [
                                  Condition.largerThan(
                                      name: MOBILE, value: 16.0),
                                  Condition.largerThan(
                                      name: TABLET, value: 19.0)
                                ]).value,
                          ),
                        ),
                      ),
                    ),
                    Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: const Color(0xFF5b59f1),
                          ),
                          onPressed: () {
                            // Respond to button press
                          },
                          child: Text(
                            "Daftar MBanking",
                            style: TextStyle(
                              fontSize: ResponsiveValue(context,
                                  defaultValue: 18.0,
                                  valueWhen: const [
                                    Condition.largerThan(
                                        name: MOBILE, value: 20.0),
                                    Condition.largerThan(
                                        name: TABLET, value: 23.0)
                                  ]).value,
                            ),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: const Color(0xFF5b59f1),
                          ),
                          onPressed: () {
                            // Respond to button press
                          },
                          child: Text(
                            "Lupa password?",
                            style: TextStyle(
                              fontSize: ResponsiveValue(context,
                                  defaultValue: 18.0,
                                  valueWhen: const [
                                    Condition.largerThan(
                                        name: MOBILE, value: 20.0),
                                    Condition.largerThan(
                                        name: TABLET, value: 23.0)
                                  ]).value,
                            ),
                          ),
                        ),
                      ],
                    )),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                color: const Color(0xFFc6cae8),
                margin: const EdgeInsets.only(top: 20.0),
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    'Copyright @2022 by Undiksha',
                    style: TextStyle(
                      fontSize: ResponsiveValue(context,
                          defaultValue: 18.0,
                          valueWhen: const [
                            Condition.largerThan(name: MOBILE, value: 20.0),
                            Condition.largerThan(name: TABLET, value: 23.0)
                          ]).value,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
