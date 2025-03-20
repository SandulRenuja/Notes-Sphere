import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/services/note_services.dart';

class NoteByCategory extends StatefulWidget {

  final String category;
  const NoteByCategory({super.key, required this.category});

  @override
  State<NoteByCategory> createState() => _NoteByCategoryState();
}

class _NoteByCategoryState extends State<NoteByCategory> {

  final NoteService noteServise = NoteService();
  List<Note> noteList = [];
  
  @override
  void initState(){
    super.initState();
    _loardNootesByCategory();
  }

  //load all notes by category
  Future <void> _loardNootesByCategory () async {
    noteList = await noteServise.getNoteCategoryName(widget.category);
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
      ),
    );
  }
}