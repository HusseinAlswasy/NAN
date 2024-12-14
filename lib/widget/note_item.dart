import 'package:flutter/material.dart';
import 'package:yy/Screens/Edit-view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const EditNote();
            },
          ),
        );
      },
      child: Container(
        height: 200,
        width: 400,
        padding: const EdgeInsets.only(top: 24, bottom: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.yellow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: const Text(
                "Flutter Tipes",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                ),
                child: Text(
                  "Build your career with Hussein",
                  style: TextStyle(
                    color: Colors.grey.withOpacity(.8),
                    fontSize: 18,
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete_outline_rounded,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 25,
              ),
              child: Text(
                '10 - 12 -2024',
                style: TextStyle(
                  color: Colors.grey.withOpacity(.8),
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
