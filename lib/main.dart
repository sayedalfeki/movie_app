import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/bloc_observer.dart';
import 'features/app_start_page.dart';
void main()
{
  Bloc.observer=MyBlocObserver();
  runApp(const MyApp());
}




