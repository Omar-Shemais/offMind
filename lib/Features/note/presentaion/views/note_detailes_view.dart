import 'package:adhd/Features/note/data/models/note.dart';
import 'package:adhd/Features/note/presentaion/views/note_editor_view.dart';
import 'package:adhd/Features/note/presentaion/views/widgets/app_app_bar.dart';
import 'package:adhd/Features/note/presentaion/views/widgets/app_icon_button.dart';
import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:adhd/core/utils/route_utils/route_utils.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:adhd/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NoteDetailsView extends StatelessWidget {
  const NoteDetailsView({super.key, required this.note});

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppAppBar(
        actions: [
          AppIconButton(
            icon: FontAwesomeIcons.penToSquare,
            onTap: () async {
              final result = await RouteUtils.push(
                 NoteEditorView(note: note),
              );
              if (result != null) {
                // ignore: use_build_context_synchronously
                Navigator.pop(context, result);
              }
            },
          ),
          const SizedBox(width: 16),
        ],
        enableBackButton: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          AppText(
            title: note.title,
            fontSize: 36,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 16.height),
          AppText(
            title: note.subtitle,
            fontSize: 24,
          ),
        ],
      ),
    );
  }
}