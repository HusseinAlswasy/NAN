import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:yy/Screens/note_view.dart';
import 'package:yy/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:yy/model/note_model.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox<NoteModel>('note box');
  Hive.registerAdapter(NoteModelAdapter());
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AddNoteCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Edu Australia VIC WA NT Hand Guides',
        ),
        home: NoteView(),
      ),
    );
  }
}
