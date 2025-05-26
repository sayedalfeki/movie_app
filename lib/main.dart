import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/cash_helper.dart';
import 'config/bloc_observer.dart';
import 'features/app_start_page.dart';
void main()async
{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer=MyBlocObserver();
  await CashHelper.getInstance();
  runApp(const MyApp());
}




