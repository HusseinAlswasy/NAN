import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yy/cubits/get_note_cubit/get_note_cubit.dart';
import 'package:yy/widget/add_modal_progrees_sheet.dart';
import 'package:yy/widget/note_view_body.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetNoteCubit(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                context: context,
                builder: (context) {
                  return AddModalProgressSheet();
                });
          },
          child: const Icon(
            Icons.add,
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: NoteViewBody(),
        ),
      ),
    );
  }
}
