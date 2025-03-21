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

  //loop through all notes create an object where the key is the category and the value is the notes in that category

  Map<String , List<Note>> getNotesByCategoryMap (List <Note> allNotes){

    final Map<String , List<Note>> notesBycategory = {};

    for(final note in allNotes){
      if(notesBycategory.containsKey(note.cayegory)){
        notesBycategory[note.cayegory]!.add(note);
      }else{
        notesBycategory[note.cayegory] = [note];
      }
    }

    return notesBycategory;
  }

  //Method to get the notes according to the category
  Future<List<Note>> getNoteCategoryName(String category) async{
    final dynamic allNotes = await _myBox.get("notes");
    final List<Note> notes = [];

    for(final note in allNotes){
      if(note.category == category){
        notes.add(note);
      }
    }
    return notes;
  }

  //Method to upadte / edit a note
 Future <void> updateNote(Note note)async{
  try{
    final dynamic allNotes = await _myBox.get("notes");
   final int index = allNotes.indexWhere((element) => element.id == note.id);
   allNotes[index] = note;
   await _myBox.put("notes", allNotes);

  }catch(err){
    print(err.toString());
  }
 }
}