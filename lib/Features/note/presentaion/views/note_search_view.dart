import 'package:adhd/Features/note/data/models/note.dart';
import 'package:adhd/Features/note/maneger/controllers/note_search_controller.dart';
import 'package:adhd/Features/note/presentaion/views/widgets/no_search_result.dart';
import 'package:adhd/Features/note/presentaion/views/widgets/note_card.dart';
import 'package:adhd/Features/note/presentaion/views/widgets/search_text_field.dart';
import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:adhd/core/utils/route_utils/route_utils.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:adhd/core/widgets/padding_app_bar.dart';
import 'package:flutter/material.dart' hide SearchController;


class NoteSearchView extends StatefulWidget {
  const NoteSearchView({super.key, required this.notes});

  final List<Note> notes;

  @override
  State<NoteSearchView> createState() => _NoteSearchViewState();
}

class _NoteSearchViewState extends State<NoteSearchView> {
  late SearchController controller;

  @override
  void initState() {
    controller = SearchController(notes: widget.notes);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: PaddingAppBar(
          appBar: AppBar(
            leading: Padding(
              padding: EdgeInsets.only(left: 10.width),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 33,
                ),
                onPressed: () {
                  RouteUtils.pop();
                },
              ),
            ),
            title: SearchTextField(
              onChanged: (v) {
                controller.search(v);
                setState(() {});
              },
            ),
          ),
          height: 80.height),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 32.height),
            Expanded(
              child: Builder(
                builder: (context) {
                  if (controller.filteredNotes.isEmpty) {
                    return const NoSearchResultVector();
                  }
                  return ListView.builder(
                    itemCount: controller.filteredNotes.length,
                    itemBuilder: (context, index) {
                      return NoteCard(note: controller.filteredNotes[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
