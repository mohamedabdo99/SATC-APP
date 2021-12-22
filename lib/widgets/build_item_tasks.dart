import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:satc/Dimension/Dimension.dart';
import 'package:satc/model/task_model/task_model.dart';
import 'package:satc/modules/task_details/task_details_screen.dart';
import 'package:satc/shared/components/components.dart';

Widget BuildItemTasks(TaskModel model , context , index) => InkWell(
  child: Card(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    elevation: Dimension.Size_5,
    margin: EdgeInsets.symmetric(
      horizontal: Dimension.Size_8,
    ),
    child: Padding(
      padding: EdgeInsets.all(Dimension.Size_8),
      child: Row(
        children: [
          CircleAvatar(
            radius: Dimension.Size_18,
            backgroundImage: NetworkImage(
              'https://img2.arabpng.com/20180401/vgw/kisspng-x-mark-check-mark-desktop-wallpaper-clip-art-x-mark-5ac194d45fdcc4.0082162715226359883927.jpg',
            ),
          ),
          const Spacer(),
          Text(
            '${model.specialty}',
            style: TextStyle(
              fontSize: Dimension.Size_18,
            ),
          ),
        ],
      ),
    ),
  ),
  onTap: (){
    navigateTo(context, TaskDetailsScreen());
  },
);