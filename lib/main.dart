import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statemanagement/screens/fastfilterbar.dart';
import 'package:statemanagement/screens/task4.dart';
import 'cubit/cubit/changecolor_cubit.dart';
import 'cubit/cubit/cubit/hidepass_cubit.dart';
import 'cubit/cubit/cubit/raido_cubit.dart';
import 'cubit/cubit/replace_ui_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ChangecolorCubit>(
          create: (BuildContext context) => ChangecolorCubit(),
        ),
        BlocProvider<HidepassCubit>(
          create: (BuildContext context) => HidepassCubit(),
        ),
        BlocProvider<RaidoCubit>(
          create: (BuildContext context) => RaidoCubit(),
        ),
        BlocProvider<ReplaceUiCubit>(
          create: (BuildContext context) => ReplaceUiCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'My App',
        home: first(), // Replace with your desired initial screen
      ),
    );
  }
}

class CounterCubit {}
