import 'dart:convert';
import 'package:adhd/Features/note/data/models/note.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController {
  List<Note> notes = [];

  Future<void> getCachedNotes() async {
    notes.clear();
    final prefs = await SharedPreferences.getInstance();
    final cachedNotes = prefs.getStringList('notes') ?? [];
    for (var i in cachedNotes) {
      notes.add(
        Note(
          subtitle: jsonDecode(i)['subtitle'],
          title: jsonDecode(i)['title'],
          id: jsonDecode(i)['id'],
        ),
      );
    }
  }

}
