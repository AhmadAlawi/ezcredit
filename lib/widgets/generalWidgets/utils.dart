import 'package:flutter/material.dart';

void postDelayed({int milliseconds = 500, required VoidCallback callbak}) {
  Future.delayed(Duration(milliseconds: milliseconds), () {
    callbak();
  });
}

Stream<int> postDelayedLoop(Duration interval) async* {
  int i = 0;
  while (true) {
    await Future.delayed(interval);
    yield i++;
  }
}

String nullSafe(dynamic data, {String placehilder = ""}) {
  if (data == null || data.toString().toLowerCase() == "null") {
    return placehilder;
  }
  return data.toString();
}

String nullOrEmpty(dynamic data, {String placehilder = ""}) {
  if (data == null ||
      data.toString().toLowerCase() == "null" ||
      data.toString().isEmpty) {
    return placehilder;
  }

  return data.toString();
}
