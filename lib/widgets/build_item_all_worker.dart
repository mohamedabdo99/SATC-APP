import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:satc/Dimension/Dimension.dart';
import 'package:satc/model/task_model/task_model.dart';
import 'package:satc/model/user_model/user_model.dart';
import 'package:satc/modules/task_details/task_details_screen.dart';
import 'package:satc/modules/worker_details/worker_details.dart';
import 'package:satc/shared/components/components.dart';

Widget BuildItemAllWroker(UserModel model , context , index) => InkWell(
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
            radius: Dimension.Size_30,
            backgroundImage: NetworkImage(
              '${model.image}',
            ),
          ),
          SizedBox(
            width: Dimension.Size_5,
          ),
          Column(
            children: [
              Text(
                '${model.name}',
                style: TextStyle(
                  fontSize: Dimension.Size_18,
                ),
              ),
              Text(
                '${model.specialty}',
                style: TextStyle(
                  fontSize: Dimension.Size_10,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  ),
  onTap: (){
    navigateTo(context, WorkerDetails(userModel: model,));
  },
);