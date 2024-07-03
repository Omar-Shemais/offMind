import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:adhd/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CreateYourFirstNoteVector extends StatelessWidget {
  const CreateYourFirstNoteVector({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'Assets/Images/create_your_first_note.png',
            height: 286.height,
            width: 350.width,
            fit: BoxFit.fill,
          ),
          SizedBox(height: 12.height),
          const AppText(
            title: 'Create your first note !',
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
        ],
      ),
    );
  }
}
