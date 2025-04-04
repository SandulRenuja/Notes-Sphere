import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/services/note_services.dart';
import 'package:notes_app/utils/colors.dart';
import 'package:notes_app/utils/constant.dart';
import 'package:notes_app/utils/router.dart';
import 'package:notes_app/utils/text_styles.dart';
import 'package:notes_app/widgets/bottom_sheet.dart';
import 'package:notes_app/widgets/notes_card.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {

  final NoteService noteService = NoteService();
  List<Note> allNotes = [];

  Map<String , List<Note>> noteWithCategory = {};

  @override
  void initState(){
    
    super.initState();
   _checkAndCreateData();
  }

  //check weather the user is new
  Future<void> _checkAndCreateData () async {

    final bool isNewUser = await noteService.isNewUser();
    //if the user is new create the initial notes
    if(isNewUser){
      await noteService.createInitialNotes();
    }

    //load the notes
    _loadNotes();
    
  }

  //load the notes
  Future<void> _loadNotes () async{
    final List<Note> loadNotes = await noteService.loadNotes();
     Map<String , List<Note>> notesBycategory = noteService.getNotesByCategoryMap(loadNotes);
    setState(() {
      allNotes = loadNotes;
     noteWithCategory = notesBycategory;

      print(noteWithCategory);
    });
  }
    //open bottom sheet
    void openBottomSheet(){
      showModalBottomSheet(
        barrierColor: AppColors.kBgColor.withOpacity(0.8),   
        context: context, 
        builder: (context){
          return CategoryInputButtonSheet(
            onNewNote: (){
              Navigator.pop(context);
              AppRouter.router.push("/create-note" , extra: false);
            }, 
            onNewCategory:(){
              Navigator.pop(context);
              AppRouter.router.push("/create-note" , extra: true);
            },
          );
        },
      ); 
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title:Text("Notes",style: AppTextStyles.appTitle,),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            //go to the home page
            AppRouter.router.go("/");
          }, 
          icon:Icon(Icons.arrow_back,),
          ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: openBottomSheet,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
          side: BorderSide(
            color: AppColors.kWhiteColor,
            width: 2,
          )
        ),
        child: Icon(
          Icons.add,
          color: AppColors.kWhiteColor,
          size: 35,
          ),
      ),
      body: Padding(
        padding: EdgeInsets.all(
          AppConstants.kDefaultPadding,
        ),
        child: Column(
          children: [
            SizedBox(height: 30,),
            allNotes.isEmpty ? SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Center(
                child: Text("No Notes are available , Please click the + button to add a new note.",
                style: AppTextStyles.appDescription
                ),
              ),
            ):GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: AppConstants.kDefaultPadding,
              mainAxisSpacing: AppConstants.kDefaultPadding,
              childAspectRatio: 6/4
              ),
              itemCount: noteWithCategory.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    AppRouter.router.push("/category",
                    extra: noteWithCategory.keys.elementAt(index)
                    );
                  },
                  child: NotesCard(
                    noteCategory:noteWithCategory.keys.elementAt(index),
                    noOfNotes: noteWithCategory.values.elementAt(index).length,
                    ),
                );
              },)
          ],
        ),
        ),
      
    );
  }
}