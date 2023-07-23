library adaptive_bibi;

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


/// A Calculator.
class Adaptive {
  static bool isiOS() => Platform.isIOS;

  static Widget scaffold({required String string, required Widget body}) {
    return isiOS() ? iOSScaffold(string, body) : androidScaffold(string, body);
  }

  static Scaffold androidScaffold(String string, Widget body) {
    return Scaffold(
      appBar: AppBar(title: Text(string),),
      body: body,
    );
  }

  static CupertinoPageScaffold iOSScaffold(String string, Widget body) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(string),
      ),
      child: body,
    );
  }
}
