import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/services/note_services.dart';
import 'package:notes_app/utils/constant.dart';
import 'package:notes_app/utils/router.dart';
import 'package:notes_app/utils/text_styles.dart';
import 'package:notes_app/widgets/note_category_card.dart';

class NoteByCategory extends StatefulWidget {

  final String category;
  const NoteByCategory({super.key, required this.category});

  @override
  State<NoteByCategory> createState() => _NoteByCategoryState();
}

class _NoteByCategoryState extends State<NoteByCategory> {

  final NoteService noteService = NoteService(); // Fix typo

  List<Note> noteList = [];
  
  @override
  void initState(){
    _loadNotesByCategory();
    super.initState(); 
  }

  //load all notes by category
  Future<void> _loadNotesByCategory() async { // Fix method name
  noteList = await noteService.getNoteCategoryName(widget.category);
  setState(() {});
}

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed:() {
            //go to the notes page
            AppRouter.router.push("/notes");
          }, 
          icon: Icon(Icons.arrow_back,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.kDefaultPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                widget.category,
                style:AppTextStyles.appTitle,
              ),
              SizedBox(
                height: 30,
              ),
             GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: AppConstants.kDefaultPadding,
                  mainAxisSpacing: AppConstants.kDefaultPadding,
                  childAspectRatio: 7 / 11,
                ),
                itemCount: noteList.length,
                itemBuilder: (context, index) {
                  return NoteCategoryCard(
                    noteTitle: noteList[index].title, 
                    noteContent: noteList[index].content, 
                    editNote: ()async {},
                    removeNote: ()async {},
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}