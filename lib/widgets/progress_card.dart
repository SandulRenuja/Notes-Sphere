import 'package:flutter/material.dart';
import 'package:notes_app/utils/colors.dart';
import 'package:notes_app/utils/text_styles.dart';

class ProgressCard extends StatefulWidget {

  final int completedTask;
  final int totalTasks;
  const ProgressCard({
    super.key, 
    required this.completedTask, 
    required this.totalTasks,
  });

  @override
  State<ProgressCard> createState() => _ProgressCardState();
}

class _ProgressCardState extends State<ProgressCard> {
  @override
  Widget build(BuildContext context) {

    //Calculation for the completion Percentage!
    double completePercentage = widget.totalTasks != 0 
    ?(widget.completedTask/widget.totalTasks) * 100
    : 0;

    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.kCardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Today's Progress",
              style: AppTextStyles.appSubtitle,
              ),
              SizedBox(height: 8,),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.66,
                child: Text(
                  "You have completed ${widget.completedTask} out of ${widget.totalTasks} tasks,\n keep up the progress!",
                style: AppTextStyles.appDescriptionSmall.copyWith(
                  color: AppColors.kWhiteColor.withOpacity(0.7),
                ),
                ),
              ),
            ],
          ),
           Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.20,
                    height: MediaQuery.of(context).size.width *0.20,
                    decoration: BoxDecoration(
                      gradient: AppColors().kPrimaryGradient,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  Positioned.fill(
                    child: Center(
                      child: Text(
                        "$completePercentage %",
                      style: AppTextStyles.appSubtitle.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),
                      )),
                  ),
                ],
              ),
        ],
      ),
    );
  }
}