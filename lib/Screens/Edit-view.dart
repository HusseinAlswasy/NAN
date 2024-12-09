import 'package:flutter/material.dart';
import 'package:yy/widget/custome_appBar.dart';
import 'package:yy/widget/custome_text_feild.dart';

import '../widget/custom_button.dart';

class EditNote extends StatelessWidget {
  const EditNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              CustomAppBar(
                text: "Edit",
                icon: Icons.edit,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomeTextFeild(
                hint: 'Edit Note',
                maxline: 1,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomeTextFeild(
                hint: 'Edit Title',
                maxline: 5,
              ),
              const SizedBox(
                height: 60,
              ),
              CustomeButton(),
            ],
          ),
        ),
      ),
    );
  }
}
