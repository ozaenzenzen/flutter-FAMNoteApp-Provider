import 'package:flutter/cupertino.dart';
import 'package:flutter_fam_noteapp/model/note.dart';

class NotesOperation extends ChangeNotifier {
  List<Note> _notes = <Note>[];

  List<Note> get getNotes {
    // notifyListeners();
    return _notes;
  }

  set setNotes(dynamic notes) {
    _notes = notes;
  }

  TextEditingController titleController = TextEditingController();

  TextEditingController get gettc {
    return titleController;
  }

  TextEditingController descController = TextEditingController();

  TextEditingController get getdc {
    return descController;
  }

  NotesOperation() {
    addNewNote(0, "First Note", "First Note Description");
  }

  void addNewNote(dynamic id, [String title, String description]) {
    Note note = Note(id: id, title: title, description: description);
    _notes.add(note);
    // setNotes(note);
    notifyListeners();
  }

  dynamic editNote(int id, String title, String description) {
    // Note note = Note(title: title, description: description);
    return _notes[id];
  }

  void deleteNote(int id) {
    _notes.removeAt(id);
    notifyListeners();
  }
}
