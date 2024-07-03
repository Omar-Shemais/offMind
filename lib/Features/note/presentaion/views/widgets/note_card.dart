import 'dart:convert';
import 'package:adhd/Features/note/data/models/note.dart';
import 'package:adhd/Features/note/presentaion/views/note_detailes_view.dart';
import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:adhd/core/utils/route_utils/route_utils.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:adhd/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.note});

  final Note note;

  EdgeInsets get _cardMargin => EdgeInsets.only(bottom: 5.height);

  BorderRadius get _radius => BorderRadius.circular(10);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) async {
        final prefs = await SharedPreferences.getInstance();
        final cachedNotes = prefs.getStringList('notes') ?? [];
        final index = cachedNotes.indexWhere((element) {
          return note.id == jsonDecode(element)['id'];
        });
        cachedNotes.removeAt(index);
        prefs.setStringList('notes', cachedNotes);
      },
      background: Container(
        margin: _cardMargin,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.red,
          borderRadius: _radius,
        ),
        child: const Icon(FontAwesomeIcons.trash,color: AppColors.white,),
      ),
      child: Padding(
        padding: _cardMargin,
        child: InkWell(
          borderRadius: _radius,
          onTap: () => RouteUtils.push(
           NoteDetailsView(note: note),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 25.width,
              vertical: 16.height,
            ),
            width: double.infinity,
      
            decoration: BoxDecoration(
              borderRadius: _radius,
              color: AppColors.lightBlue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  title: note.title,
                  color: AppColors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                AppText(
                  title: note.subtitle,
                  color: AppColors.darkGray,
                  fontSize: 12,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
