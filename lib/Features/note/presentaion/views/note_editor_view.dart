// ignore_for_file: use_build_context_synchronously
import 'package:adhd/Features/note/data/models/note.dart';
import 'package:adhd/Features/note/maneger/controllers/note_editor_controller.dart';
import 'package:adhd/Features/note/presentaion/views/widgets/app_app_bar.dart';
import 'package:adhd/Features/note/presentaion/views/widgets/app_icon_button.dart';
import 'package:adhd/Features/note/presentaion/views/widgets/app_text_field.dart';
import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:adhd/core/widgets/app_dialog.dart';
import 'package:adhd/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NoteEditorView extends StatefulWidget {
  const NoteEditorView({
    super.key,
    this.note,
  });

  final Note? note;

  @override
  State<NoteEditorView> createState() => _NoteEditorViewState();
}

class _NoteEditorViewState extends State<NoteEditorView> {
  late NoteEditorController controller;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
        context: context, initialTime: _selectedTime ?? TimeOfDay.now()
        );
    
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  void _showDateTimePickerMenu(BuildContext context) {
    showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(50, 50, 50, 50),
      items: [
        PopupMenuItem(
          child: ListTile(
            leading: const Icon(
              Icons.calendar_today,
              color: AppColors.blue,
            ),
            title: const AppText(
              title: 'Pick Date',
              color: AppColors.darkGray,
            ),
            onTap: () {
              Navigator.pop(context);
              _selectDate(context);
            },
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            leading: const Icon(
              Icons.access_time,
              color: AppColors.blue,
            ),
            title: const AppText(
              title: 'Pick Time',
              color: AppColors.darkGray,
            ),
            onTap: () {
              Navigator.pop(context);
              _selectTime(context);
            },
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    controller = NoteEditorController(note: widget.note);
    controller.titleTXController.text = widget.note?.title ?? '';
    controller.subtitleTXController.text = widget.note?.subtitle ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppAppBar(
        enableBackButton: true,
        actions: [
          AppIconButton(
            icon: FontAwesomeIcons.eye,
            onTap: () {},
            padding: EdgeInsets.only(right: 16.width),
          ),
          AppIconButton(
            icon: FontAwesomeIcons.floppyDisk,
            onTap: () => AppDialog.show(
              context,
              message: "Save changes ?",
              confirmTitle: "Save",
              onConfirm: () async {
                Note? note;
                if (widget.note == null) {
                  note = await controller.addNote();
                } else {
                  note = await controller.editNote();
                }
                if (note == null) {
                  Navigator.pop(context);
                } else {
                  Navigator.pop(context);
                  Navigator.pop(
                    context,
                    note,
                  );
                }
              },
              onCancel: () {
                Navigator.pop(context);
              },
            ),
          ),
          const SizedBox(width: 16),
          AppIconButton(
            icon:Icons.alarm,
            onTap: () => _showDateTimePickerMenu(context),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Form(
        key: controller.formKey,
        child: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.all(16),
          children: [
            AppTextField(
              hint: 'Title',
              cursorHeight: 52,
              hintFontSize: 48,
              maxLength: 50,
              controller: controller.titleTXController,
              validator: (v) {
                if (v == null || v.trim().isEmpty) {
                  return 'Empty field!';
                }
                return null;
              },
            ),
            SizedBox(height: 16.height),
            AppTextField(
              hint: "Type Something...",
              controller: controller.subtitleTXController,
              validator: (v) {
                if (v == null || v.trim().isEmpty) {
                  return 'Empty field!';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
