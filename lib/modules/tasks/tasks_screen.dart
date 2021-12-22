import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:satc/Dimension/Dimension.dart';
import 'package:satc/Theme/themes.dart';
import 'package:satc/layout/home_layout_cubit/home_layout_cubit.dart';
import 'package:satc/layout/home_layout_cubit/home_layout_states.dart';
import 'package:satc/widgets/build_item_tasks.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit , HomeLayoutStates>(
      listener: (context , state ) {},
      builder: (context , state ) {
        var cubit = HomeLayoutCubit.get(context);
        return Column(
          children: [
            if(cubit.tasks.isEmpty)
            const SizedBox(
              height: 40.0,
            ),
            if(cubit.tasks.isEmpty)
            Center(
              child: Text(
              'No Tasks Yet',
              style: TextStyle(
              color: Themes.Primary,
              fontSize: Dimension.Size_32,
              ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.all(Dimension.Size_18),
              child: ConditionalBuilder(
                condition: cubit.tasks.isNotEmpty,
                builder: (context) => SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => BuildItemTasks(cubit.tasks[index], context, index),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 10.0,
                    ),
                    itemCount: cubit.tasks.length,
                  ),
                ),
                fallback: (context) =>
                    Center(child: const CircularProgressIndicator()),
              ),
            ),
          ],
        );
      },
    );
  }
}
