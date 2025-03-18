import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:uuid/uuid.dart';

class NoteService{
  List<Note> allNotes = [
    Note(
      id: Uuid().v4(),
      title: "Meeting Notes", 
      cayegory: "Work", 
      content: "Discussed project deadlines and deliverables. Assigned tasks to team member and set up follow-up meeting to track progress", 
      date: DateTime.now(),
    ),
     Note(
      id: Uuid().v4(),
      title: "Book Recomendations", 
      cayegory: "Hobby", 
      content: "Discussed project deadlines and deliverables. Assigned tasks to team member and set up follow-up meeting to track progress", 
      date: DateTime.now(),
    ),
     Note(
      id: Uuid().v4(),
      title: "Grocery List", 
      cayegory: "Personal", 
      content: "Bought milk, eggs, bread, fruit and vegetable from the local grocery store.Also added some snacks  for the week.", 
      date: DateTime.now(),
    ),
  ];

  //Create the database reference for notes
    final _myBox = Hive.box("notes");

  //check wether the user is new user
  Future<bool> isNewUser () async{
    return _myBox.isEmpty;
  }

  //Method to create the initial notes if the box is empty
  Future<void> createInitialNotes () async{
    if(_myBox.isEmpty){
      await _myBox.put("notes", allNotes);
    }
  }

  //Method to load the notes
  Future<List<Note>> loadNotes () async{

    final dynamic notes = _myBox.get("notes");

    if(notes != null && notes is List<dynamic>){
      return notes.cast<Note>().toList();
    }

    return [];
  }
}