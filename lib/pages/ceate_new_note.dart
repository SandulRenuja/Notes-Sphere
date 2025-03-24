import 'package:flutter/material.dart';
import 'package:notes_app/services/note_services.dart';
import 'package:notes_app/utils/constant.dart';
import 'package:notes_app/utils/text_styles.dart';

class CreateNotePage extends StatefulWidget {

  final bool isNewCategory;

  const CreateNotePage({
    super.key, 
    required this.isNewCategory
  });

  @override
  State<CreateNotePage> createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  List<String> categories = [];
  final NoteService noteService = NoteService();

  Future _loardCategories()async{
    categories = await noteService.getAllCategories();
    setState(() {
      
    });
  }
  @override
  void initState() {
    _loardCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create Note",
          style: AppTextStyles.appSubtitle,
        )
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: AppConstants.kDefaultPadding / 2,
              ),
              child: Form(
                child: Column(
                  children: [
                 
                  ],
                )),
            ),
          ],
        ),
      ),
    );
  }
}