import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:satc/layout/home_layout_cubit/home_layout_cubit.dart';
import 'package:satc/layout/home_layout_cubit/home_layout_states.dart';
import 'package:satc/model/user_model/user_model.dart';
import 'package:satc/widgets/build_my_profile_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeLayoutCubit.get(context);
        return Scaffold(
          body: MyProfileBody(
            userModel: cubit.userModel as UserModel,
          ),
        );
      },
    );
  }
}
