import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:satc/Dimension/Dimension.dart';
import 'package:satc/layout/home_layout_cubit/home_layout_cubit.dart';
import 'package:satc/layout/home_layout_cubit/home_layout_states.dart';
import 'package:satc/model/user_model/user_model.dart';
import 'package:satc/widgets/build_all_worker_body.dart';

class WorkerDetails extends StatelessWidget {
  final UserModel userModel;
  final dynamic index;
  const WorkerDetails({Key? key, required this.userModel, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeLayoutCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
          ),
          body: AllWorkerBody(
            userModel: cubit.users[index],
          ),
        );
      },
    );
  }
}
