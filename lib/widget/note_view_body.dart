import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yy/cubits/get_note_cubit/get_note_cubit.dart';

import 'package:yy/widget/custome_appBar.dart';
import 'package:yy/widget/note_list_view.dart';

class NoteViewBody extends StatefulWidget {
  const NoteViewBody({super.key});

  @override
  State<NoteViewBody> createState() => _NoteViewBodyState();
}

class _NoteViewBodyState extends State<NoteViewBody> {
  @override
  void initState() {
    BlocProvider.of<GetNoteCubit>(context).getAllNote();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        CustomAppBar(
          text: "Nota",
          icon: Icons.search_rounded,
        ),
        const Expanded(child: NoteListView()),
      ],
    );
  }
}
