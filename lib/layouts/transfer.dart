import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:module3_layout_and_navigation/layouts/home.dart';
import 'package:module3_layout_and_navigation/services/list_users_services.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Transfer extends StatefulWidget {
  const Transfer({super.key});

  @override
  State<Transfer> createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(26, 36, 127, 1),
        title: Center(
          child: Text(
          'Input Transfer',
          style: TextStyle(
              fontSize: ResponsiveValue(context,
                  defaultValue: 20.0,
                  valueWhen: const [
                      Condition.largerThan(name: MOBILE, value: 22.0),
                      Condition.largerThan(name: TABLET, value: 25.0)
                  ]).value,
          ),),
        ),
        
      ),
      body: Container(
        child: Form(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            TextFormField(
              maxLines: 1,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nasabah Tujuan',
                hintText: 'Nasabah Tujuan'),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              maxLines: 1,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Masukkan Nominal',
                hintText: 'Masukkan Nominal'),
            ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromRGBO(26, 36, 127, 1)),
            child: Center(
              child: Text(
                "Kirim",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
