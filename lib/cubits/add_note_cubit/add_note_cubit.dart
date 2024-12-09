import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:yy/cubits/add_note_cubit/add_note_state.dart';
import 'package:yy/model/note_model.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  addNote(NoteModel note) async {
    try {
      var notebox = Hive.box('note box');
      await notebox.add(note);
    } catch (e) {
      AddNoteFailuer(e.toString());
    }
  }
}
