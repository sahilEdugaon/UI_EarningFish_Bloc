import 'package:earning_fish_ui/Screen/fish_details.dart';
import 'package:earning_fish_ui/bloc/fish_bloc.dart';
import 'package:earning_fish_ui/bloc/fish_event.dart';
import 'package:earning_fish_ui/utlits/get_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Screen/home.dart';

void main() {

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => FishBloc()..add(LoadFishData()),
        child: const NemoFishScreen(),
      ),
    );
  }
}
