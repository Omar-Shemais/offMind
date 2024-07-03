// ignore_for_file: use_build_context_synchronously
import 'package:adhd/Features/note/maneger/controllers/note_main_controller.dart';
import 'package:adhd/Features/note/presentaion/views/note_editor_view.dart';
import 'package:adhd/Features/note/presentaion/views/note_search_view.dart';
import 'package:adhd/Features/note/presentaion/views/widgets/app_app_bar.dart';
import 'package:adhd/Features/note/presentaion/views/widgets/app_icon_button.dart';
import 'package:adhd/Features/note/presentaion/views/widgets/create_your_first_note_vector.dart';
import 'package:adhd/Features/note/presentaion/views/widgets/note_card.dart';
import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:adhd/core/utils/route_utils/route_utils.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:adhd/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NoteMainView extends StatefulWidget {
  const NoteMainView({super.key});

  @override
  State<NoteMainView> createState() => _NoteMainViewState();
}

class _NoteMainViewState extends State<NoteMainView> {
  HomeController controller = HomeController();

  @override
  void initState() {
    controller.getCachedNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppAppBar(
        title: "Notes",
        enableBackButton: true,
        actions: [
          AppIconButton(
            icon: FontAwesomeIcons.magnifyingGlass,
            onTap: () => RouteUtils.push(
              NoteSearchView(notes: controller.notes),
            ),
          ),
          SizedBox(width: 12.width),
          SizedBox(width: 16.width),
        ],
      ),
      body: Builder(
        builder: (context) {
          if (controller.notes.isEmpty) {
            return const CreateYourFirstNoteVector();
          }
          return RefreshIndicator(
            onRefresh: () async {
              await controller.getCachedNotes();
              setState(() {});
            },
            color: AppColors.white,
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: controller.notes.length,
              itemBuilder: (context, index) {
                return NoteCard(
                  note: controller.notes[index],
                );
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.lightBlue,
        child: Row(
          children: [
            IconButton(
                icon: const Icon(
                  Icons.notifications_active_outlined,
                  size: 30,
                ),
                onPressed: () {}),
            const Spacer(),
            Row(
              children: [
                AppText(
                  title: controller.notes.length.toString(),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  width: 5.width,
                ),
                const AppText(
                  title: 'Note',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )
              ],
            ),
            const Spacer(),
            IconButton(
                icon: const Icon(
                  FontAwesomeIcons.penToSquare,
                  size: 25,
                ),
                onPressed: () async {
                  final result = await RouteUtils.push(
                    const NoteEditorView(),
                  );
                  if (result != null) {
                    controller.notes.insert(0, result);
                    setState(() {});
                  }
                }),
          ],
        ),
      ),
    );
  }
}


  // floatingActionButton: FloatingActionButton(
  //       child: Icon(
  //         FontAwesomeIcons.plus,
  //         size: 24.height,
  //       ),
  //       onPressed: () async {
  //         final result = await RouteUtils.push(
  //           context: context,
  //           view: const NoteEditorView(),
  //         );
  //         if (result != null) {
  //           controller.notes.insert(0, result);
  //           setState(() {});
  //         }
  //       },
  //     ),