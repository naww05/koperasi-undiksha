import 'package:flutter/material.dart';
import 'package:module3_layout_and_navigation/layouts/login.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'dart:io';

void main() {
  runApp(
    MaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, child!),
        maxWidth: 1200,
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(350, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(600, name: TABLET),
          const ResponsiveBreakpoint.resize(800, name: DESKTOP),
          const ResponsiveBreakpoint.autoScale(1700, name: "XL"),
        ],
      ),
      debugShowCheckedModeBanner: false,
      home: Login(),
    ),
  );
}
