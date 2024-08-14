
import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Debouncer{

  final int milliseconds;
  VoidCallback? action;
  Timer? timer;

  Debouncer({
    required this.milliseconds,
    this.action
});

  run(VoidCallback action){
    if(timer!=null){
      timer?.cancel();
    }
    timer = Timer(Duration(milliseconds: milliseconds), action);
  }

}