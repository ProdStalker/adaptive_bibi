library adaptive_bibi;

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


/// A Calculator.
class Adaptive {
  static bool isiOS() => Platform.isIOS;

  static text({required String string, Color? color, double? size, TextAlign? align}) {
    TextStyle style = textStyle(color: color, size: size);
    return isiOS()
        ? iOSText(string: string, textStyle: style, align: align)
        : androidText(string: string, textStyle: style, align: align);
  }

  static Text androidText({required String string, required TextStyle textStyle, TextAlign? align}) {
    return Text(
      string,
      style: textStyle,
    );
  }

  static DefaultTextStyle iOSText({required String string, required TextStyle textStyle, TextAlign? align}) {
    return DefaultTextStyle(
      style: textStyle,
      child: Text(
        string,
        textAlign: align ?? TextAlign.left,
      ),
    );
  }

  static TextStyle textStyle({Color? color, double? size, TextAlign? align}) {
    return TextStyle(
      color: color ?? Colors.black,
      fontSize: size,
    );
  }

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
