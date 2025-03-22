import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/pages/ceate_new_note.dart';
import 'package:notes_app/pages/home_page.dart';
import 'package:notes_app/pages/note_by_category.dart';
import 'package:notes_app/pages/notes_page.dart';
import 'package:notes_app/pages/todo_page.dart';

class AppRouter{
  static final router = GoRouter(
    navigatorKey: GlobalKey<NavigatorState>(),
    debugLogDiagnostics: false,
    initialLocation: "/",
    routes: [
      //Home Page
      GoRoute(
        name: "home",
        path: "/",
        builder: (context, state) {
          return HomePage();
        },
      ),

      //Notes page
      GoRoute(
        name: "notes",
        path: "/notes",
        builder: (context, state) {
          return NotesPage();
        },
      ),

      //To do page
      GoRoute(
        name: "todo",
        path: "/todos",
        builder: (context, state) {
          return TodoPage();
        },
      ),

      //note by category
      GoRoute(
        name: "category",
        path: "/category",
        builder: (context, state) {
          final String category = state.extra as String;
          return NoteByCategory(category: category);
        },
      ),

      //ceate new note
      GoRoute(
        path: "/create-note",
        builder: (context, state) {
          final isNewCategoryPage = state.extra as bool;
          return CreateNotePage(
            isNewCategory: isNewCategoryPage);
        },
        )
      ],

  );
}