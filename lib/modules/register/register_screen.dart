import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:satc/Dimension/Dimension.dart';
import 'package:satc/Theme/themes.dart';
import 'package:satc/helper/local/cache_helper.dart';
import 'package:satc/layout/home_layout.dart';
import 'package:satc/modules/register/cubit/register_cubit.dart';
import 'package:satc/modules/register/cubit/register_states.dart';
import 'package:satc/shared/components/components.dart';
import 'package:satc/shared/contants/constants.dart';
import 'package:satc/widgets/default_button.dart';
import 'package:satc/widgets/default_text.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> fromKey = GlobalKey();

    var emailController = TextEditingController();
    var nameController = TextEditingController();
    var specialtyController = TextEditingController();
    var passwordController = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterErrorState) {
            buildShowToast(
              text: state.error,
              state: ToastState.ERROR,
            );
          }
          if(state is CreateUserSuccessState){
            CacheHelper.saveData(
                key: "uId", value: state.uId)
                .then((value) {
              uId = state.uId;
              navigateToAndFinish(
                context,
                const HomeLayoutScreen(),
              );
            });
          }
        },
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: Text(
                'RGISTER',
              ),
              elevation: 0.0,
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: fromKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 8.0,
                        ),
                        child: DefaultTextField(
                          enableValidation: true,
                          controller: nameController,
                          textInputType: TextInputType.text,
                          prefixIcon: Icons.person,
                          label: 'Name',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 8.0,
                        ),
                        child: DefaultTextField(
                          enableValidation: true,
                          controller: emailController,
                          textInputType: TextInputType.emailAddress,
                          prefixIcon: Icons.email,
                          label: 'Email',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 8.0,
                        ),
                        child: DefaultTextField(
                          enableValidation: true,
                          controller: specialtyController,
                          textInputType: TextInputType.text,
                          prefixIcon: Icons.article_sharp,
                          label: 'Specialty',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 8.0,
                        ),
                        child: DefaultTextField(
                          enableValidation: true,
                          controller: passwordController,
                          textInputType: TextInputType.visiblePassword,
                          obscureText: true,
                          prefixIcon: Icons.lock,
                          label: 'Password',
                        ),
                      ),
                      Center(
                        child: ConditionalBuilder(
                          condition: state is! RegisterLoadingState,
                          builder: (context) => Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Dimension.Padding,
                              vertical: Dimension.Padding,
                            ),
                            child: defaultButton(
                              background: Themes.Primary,
                              height: 40,
                              function: () {
                                if (fromKey.currentState!.validate()) {
                                  cubit.userRegister(
                                    name: nameController.text,
                                    specialty: specialtyController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                }
                              },
                              text: 'Create',
                            ),
                          ),
                          fallback: (context) =>
                              const Center(child: CircularProgressIndicator()),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
