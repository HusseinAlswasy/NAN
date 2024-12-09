import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yy/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:yy/cubits/add_note_cubit/add_note_state.dart';
import 'package:yy/model/note_model.dart';
import 'package:yy/widget/custom_button.dart';
import 'package:yy/widget/custome_text_feild.dart';

class AddModalProgressSheet extends StatelessWidget {
  const AddModalProgressSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: AddNoteForm(),
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
