import 'package:flutter/material.dart';
import 'package:notes_app/utils/colors.dart';
import 'package:notes_app/utils/text_styles.dart';

class NotesTodooCard extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon; 
  const NotesTodooCard({
    super.key, 
    required this.title, 
    required this.description, 
    required this.icon
  });

  @override
  State<NotesTodooCard> createState() => _NotesTodooCardState();
}

class _NotesTodooCardState extends State<NotesTodooCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      decoration: BoxDecoration(
        color: AppColors.kCardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
        child: Column(
          children: [
            Icon(
              widget.icon,
              size: 40,
            ),
            SizedBox(height: 10,),
            Text(
              widget.title,
              style: AppTextStyles.appDescription,
            ),
            SizedBox(height: 10,),
            Text(
              widget.description,
              style: AppTextStyles.appDescription.copyWith(
                color: AppColors.kWhiteColor.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}