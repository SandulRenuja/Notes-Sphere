import 'package:flutter/material.dart';
import 'package:notes_app/utils/constant.dart';
import 'package:notes_app/utils/router.dart';
import 'package:notes_app/utils/text_styles.dart';
import 'package:notes_app/widgets/notes_todoo_card.dart';
import 'package:notes_app/widgets/progress_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NoteSphere",
        style: AppTextStyles.appTitle,
        ),
      ),
      body: Padding(
        padding:EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(height: AppConstants.kDefaultPadding,),
            ProgressCard(
              completedTask: 10, 
              totalTasks: 10,
            ),

            SizedBox(height: AppConstants.kDefaultPadding * 1.5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    //go to the notes page
                    AppRouter.router.push("/notes");
                  },
                  child: NotesTodooCard(
                    title: "Notes", 
                    description: "3 Notes", 
                    icon: Icons.bookmark_add_outlined,
                  ),
                ),
                 GestureDetector(
                  onTap: () {
                    //go to to-do page
                    AppRouter.router.push("/todos");
                  },
                   child: NotesTodooCard(
                    title: "To-Do List", 
                    description: "3 Tasks", 
                    icon: Icons.today_outlined,
                                   ),
                 ),
              ],
            ),

            SizedBox(height: AppConstants.kDefaultPadding * 1.5,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Today's Progress",
                style: AppTextStyles.appSubtitle,
                ),
                Text("See All",
                style: AppTextStyles.appButton,
                ),
              ],
            ),

          ],
        ),
      ),
        
    );
  }
}