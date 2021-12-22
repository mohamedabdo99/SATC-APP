import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:satc/Theme/themes.dart';
import 'package:satc/layout/home_layout_cubit/home_layout_cubit.dart';
import 'package:satc/layout/home_layout_cubit/home_layout_states.dart';

class HomeLayoutScreen extends StatelessWidget {
  const HomeLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit  , HomeLayoutStates>(
      listener: (context ,  state ) {},
      builder: (context ,  state )
      {
        var cubit = HomeLayoutCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            title: Text(
              cubit.title[cubit.currentIndex],
            ),
          ),
          body: cubit.screen[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Themes.Primary,
            items: cubit.items,
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeBottomIndex(index);
            },
          ),
        );
      },
    );
  }
}
