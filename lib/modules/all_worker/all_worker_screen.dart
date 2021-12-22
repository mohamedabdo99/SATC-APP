import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:satc/Dimension/Dimension.dart';
import 'package:satc/layout/home_layout_cubit/home_layout_cubit.dart';
import 'package:satc/layout/home_layout_cubit/home_layout_states.dart';
import 'package:satc/widgets/build_item_all_worker.dart';

class AllWorkerScreen extends StatelessWidget {
  const AllWorkerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<HomeLayoutCubit , HomeLayoutStates>(
      listener: (context ,  builder) {},
      builder: (context ,  builder) {
        var cubit = HomeLayoutCubit.get(context);
        return Padding(
          padding:  EdgeInsets.all(Dimension.Size_18),
          child: ConditionalBuilder(
            condition: cubit.users.isNotEmpty,
            builder: (context) => SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => BuildItemAllWroker(cubit.users[index], context, index),
                separatorBuilder: (context, index) => SizedBox(
                  height: 10.0,
                ),
                itemCount: cubit.users.length,
              ),
            ),
            fallback: (context) =>
                Center(child: const CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
