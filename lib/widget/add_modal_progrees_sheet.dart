import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:yy/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:yy/cubits/add_note_cubit/add_note_state.dart';
import 'package:yy/model/note_model.dart';
import 'package:yy/widget/custom_button.dart';
import 'package:yy/widget/custome_text_feild.dart';

class AddModalProgressSheet extends StatelessWidget {
  AddModalProgressSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: BlocConsumer<AddNoteCubit, AddNoteState>(
          listener: (context, state) {
            if (state is AddNoteFailuer) {
              print('Failed ${state.error}');
            }
            if (state is AddNoteSuccess) {
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is AddNoteLoading ? true : false,
              child: SingleChildScrollView(
                child: AddNoteForm(),
              ),
            );
          },
        ),
      ),
    );
  }
}

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          CustomeTextFeild(
            onsaved: (value) {
              title = value;
            },
            hint: 'Add Note',
            maxline: 1,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomeTextFeild(
            onsaved: (value) {
              subtitle = value;
            },
            hint: 'Add Title',
            maxline: 5,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomeButton(
            onTap: () {
              if (formkey.currentState!.validate()) {
                formkey.currentState!.save();
                var note = NoteModel(
                    title: title!,
                    subtitle: subtitle!,
                    date: DateTime.now().toString());
                BlocProvider.of<AddNoteCubit>(context).addNote(note);
              } else {
                autovalidateMode = AutovalidateMode.always;
              }
            },
          ),
        ],
      ),
    );
  }
}
