import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:satc/Dimension/Dimension.dart';
import 'package:satc/Theme/themes.dart';
import 'package:satc/layout/home_layout_cubit/home_layout_cubit.dart';
import 'package:satc/layout/home_layout_cubit/home_layout_states.dart';
import 'package:satc/widgets/default_button.dart';
import 'package:satc/widgets/default_text.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> fromKey = GlobalKey();

    var taskSpecifyController = TextEditingController();
    var taskTitleController = TextEditingController();
    var taskDescController = TextEditingController();
    var deadlineController = TextEditingController();

    return BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeLayoutCubit.get(context);

        return SingleChildScrollView(
          child: Form(
            key: fromKey,
            child: Column(
              children: [
                SizedBox(
                  height: Dimension.Size_5,
                ),
                Text(
                  'All field are required',
                  style: TextStyle(
                    color: Themes.Primary,
                    fontSize: Dimension.Size_18,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimension.Size_10,
                    vertical: Dimension.Size_30,
                  ),
                  child: DefaultTextField(
                    controller: taskSpecifyController,
                    label: "specialty",
                    enableValidation: true,
                    textInputType: TextInputType.text,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimension.Size_10,
                    vertical: Dimension.Size_18,
                  ),
                  child: DefaultTextField(
                    controller: taskTitleController,
                    label: "Title",
                    enableValidation: true,
                    textInputType: TextInputType.text,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimension.Size_10,
                    vertical: Dimension.Size_18,
                  ),
                  child: DefaultTextField(
                    controller: taskDescController,
                    label: "Description",
                    enableValidation: true,
                    textInputType: TextInputType.text,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimension.Size_10,
                    vertical: Dimension.Size_18,
                  ),
                  child: DefaultTextField(
                    controller: deadlineController,
                    label: "Deadline",
                    enableValidation: true,
                    textInputType: TextInputType.number,
                  ),
                ),
                Center(
                  child: ConditionalBuilder(
                    condition: state is! HomeLoadingCreateTaskState,
                    builder: (context) =>
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 10.0,
                          ),
                          child: defaultButton(
                            background: Themes.Primary,
                            height: 40,
                            function: () {
                              var time = DateTime.now();
                              if (fromKey.currentState!.validate()) {
                                cubit.createTask(
                                  specialty: taskSpecifyController.text,
                                  title: taskTitleController.text,
                                  description: taskDescController.text,
                                  deadline: deadlineController.text,
                                  uplodedOn:time.toString(),
                                );
                                taskSpecifyController.text = '';
                                taskTitleController.text = '';
                                taskDescController.text = '';
                                deadlineController.text = '';
                              }
                            },
                            text: 'upload',
                          ),
                        ),
                    fallback: (context) =>
                    const Center(child: CircularProgressIndicator()),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
