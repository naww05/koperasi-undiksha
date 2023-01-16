import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class detailbox extends StatelessWidget {
  final String title;
  final String desc;
  detailbox(this.title, this.desc);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFc6cae8),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              // width: 200,
              child: Text(
                title,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: ResponsiveValue(context,
                      defaultValue: 14.0,
                      valueWhen: const [
                        Condition.largerThan(name: MOBILE, value: 18.0),
                        Condition.largerThan(name: TABLET, value: 24.0),
                        Condition.largerThan(name: DESKTOP, value: 32.0),
                      ]).value,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              // width: 200,
              child: Text(
                desc,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: ResponsiveValue(context,
                      defaultValue: 14.0,
                      valueWhen: const [
                        Condition.largerThan(name: MOBILE, value: 18.0),
                        Condition.largerThan(name: TABLET, value: 24.0),
                        Condition.largerThan(name: DESKTOP, value: 32.0),
                      ]).value,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
