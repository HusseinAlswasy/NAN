import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yy/cubits/get_note_cubit/get_note_cubit.dart';
import 'package:yy/cubits/get_note_cubit/get_note_state.dart';
import 'package:yy/model/note_model.dart';
import 'package:yy/widget/note_item.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNoteCubit, GetNoteState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<GetNoteCubit>(context).notes ?? [];
        return ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, item) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: NoteItem(),
            );
          },
        );
      },
    );
  }
}
