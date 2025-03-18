import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/models/todo_model.dart';
import 'package:notes_app/utils/router.dart';
import 'package:notes_app/utils/theme_data.dart';

void main() async{

  //initialize hive
  await Hive.initFlutter();

  //register the adapters
  Hive.registerAdapter(NoteAdapter());
  Hive.registerAdapter(TodoAdapter());

  //open hive boxes
  await Hive.openBox('notes');
  await Hive.openBox('todos'); 

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "NoteSphere",
      debugShowCheckedModeBanner: false,
      theme: ThemeClass.darkTheme.copyWith(
        textTheme: GoogleFonts.dmSansTextTheme(Theme.of(context).textTheme,
      ),
    ),
      routerConfig: AppRouter.router,
    );
  }
}