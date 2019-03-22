import 'package:flutter/material.dart';

class AppState{
  final int count;
  AppState({@required this.count});

  AppState.initialState() : count = 0;
}