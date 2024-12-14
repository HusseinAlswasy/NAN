import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:yy/cubits/get_note_cubit/get_note_state.dart';
import 'package:yy/model/note_model.dart';

class GetNoteCubit extends Cubit<GetNoteState> {
  GetNoteCubit() : super(GetNoteInitial());

  List<NoteModel>? notes;
  getAllNote() async {
    var notebox = Hive.box<NoteModel>('note box');

    notes = notebox.values.toList();

    emit(GetNoteSuccess(notes!));
  }
}
