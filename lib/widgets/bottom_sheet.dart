import 'package:flutter/material.dart';
import 'package:notes_app/utils/colors.dart';
import 'package:notes_app/utils/constant.dart';
import 'package:notes_app/utils/text_styles.dart';

class CategoryInputButtonSheet extends StatefulWidget {

  final Function() onNewNote;
  final Function() onNewCategory;
  const CategoryInputButtonSheet({
    super.key, 
    required this.onNewNote, 
    required this.onNewCategory
  });

  @override
  State<CategoryInputButtonSheet> createState() => _CategoryInputButtonSheetState();
}

class _CategoryInputButtonSheetState extends State<CategoryInputButtonSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.5 ,
      decoration: BoxDecoration(
        color: AppColors.kCardColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.kDefaultPadding * 1.5),
        child: Column(
          children: [
            GestureDetector(
              onTap: widget.onNewNote,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Create a New Note",
                    style: AppTextStyles.appDescription,
                  ),
                  Icon(Icons.arrow_right_outlined,),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Divider(
              color: AppColors.kWhiteColor.withOpacity(0.3),
              thickness: 1,
            ),
            SizedBox(height: 30,),
            GestureDetector(
              onTap: widget.onNewCategory,
              child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Create a new note category",
                    style: AppTextStyles.appDescription,
                  ),
                  Icon(Icons.arrow_right_outlined,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}