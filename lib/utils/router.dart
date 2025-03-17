import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/pages/home_page.dart';
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
        )
    ],

  );
}