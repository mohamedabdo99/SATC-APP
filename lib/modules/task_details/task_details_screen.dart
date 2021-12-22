import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:satc/Dimension/Dimension.dart';
import 'package:satc/Theme/themes.dart';
import 'package:satc/layout/home_layout_cubit/home_layout_cubit.dart';
import 'package:satc/layout/home_layout_cubit/home_layout_states.dart';
import 'package:satc/shared/components/components.dart';
import 'package:satc/widgets/default_button.dart';
import 'package:satc/widgets/default_text_button.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit , HomeLayoutStates>(
      listener:(context , state) {},
      builder:(context , state) {
        var cubit = HomeLayoutCubit.get(context);
        return  Scaffold(
          appBar: AppBar(
            elevation: 0.0,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(
                    vertical: Dimension.Size_18,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Uploaded by : ' ,
                        style: TextStyle(
                          color: Themes.Primary,
                          fontSize: Dimension.Size_22,
                        ),
                      ),
                      SizedBox(
                        width: Dimension.Size_2,
                      ),
                      Text(
                        '${cubit.userModel!.name}' ,
                        style: TextStyle(
                          color: Themes.Text_Color,
                          fontSize: Dimension.Size_15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ],
                  ),
                ),
                myDivider(),
                SizedBox(
                  height: Dimension.Size_20,
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(
                    horizontal: Dimension.Size_5,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Uploaded On : ' ,
                            style: TextStyle(
                              color: Themes.Primary,
                              fontSize: Dimension.Size_22,
                            ),
                          ),
                          SizedBox(
                            width: Dimension.Size_2,
                          ),
                          Text(
                            '${cubit.taskModel?.uplodedOn}' ,
                            style: TextStyle(
                              color: Themes.Text_Color,
                              fontSize: Dimension.Size_15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                        ],
                      ),
                      SizedBox(
                        height: Dimension.Size_8,
                      ),
                      myDivider(),
                      SizedBox(
                        height: Dimension.Size_8,
                      ),
                      Row(
                        children: [
                          Text(
                            'Deadline : ' ,
                            style: TextStyle(
                              color: Themes.Primary,
                              fontSize: Dimension.Size_22,
                            ),
                          ),
                          SizedBox(
                            width: Dimension.Size_2,
                          ),
                          Text(
                            '${cubit.taskModel?.deadLine}' ,
                            style: TextStyle(
                              color: Themes.Text_Color,
                              fontSize: Dimension.Size_15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                        ],
                      ),
                      SizedBox(
                        height: Dimension.Size_15,
                      ),
                    ],
                  ),
                ),
                myDivider(),
                if(cubit.taskModel!.uId == cubit.userModel!.uid)
                Padding(
                  padding:  EdgeInsets.all(
                    Dimension.Size_20,
                  ),
                  child: Text(
                    'Done State',
                    style: TextStyle(
                      color: Themes.Primary,
                      fontSize: Dimension.Size_22,
                    ),
                  ),
                ),
                if(cubit.taskModel!.uId == cubit.userModel!.uid)
                Row(
                  children: [
                    SizedBox(
                      width: Dimension.Size_20,
                    ),
                    OutlinedButton(
                      onPressed: () {
                      },
                      child:  Text(
                        'Done',
                        style: TextStyle(
                          color: Themes.Button_Color2,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Dimension.Size_20,
                    ),
                    OutlinedButton(
                      onPressed: () {
                      },
                      child:  Text(
                        'Non',
                        style: TextStyle(
                          color: Themes.Red,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
