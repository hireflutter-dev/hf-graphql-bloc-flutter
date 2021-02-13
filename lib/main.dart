import 'package:flutter/material.dart';
import 'package:fluttergraphql/bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'src/country_app.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}
