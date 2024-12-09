import 'package:flutter/material.dart';

import 'package:yy/widget/custome_appBar.dart';
import 'package:yy/widget/note_list_view.dart';

class NoteViewBody extends StatelessWidget {
  const NoteViewBody({super.key});

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
