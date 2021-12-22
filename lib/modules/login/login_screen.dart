import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:satc/Dimension/Dimension.dart';
import 'package:satc/Theme/themes.dart';
import 'package:satc/helper/local/cache_helper.dart';
import 'package:satc/layout/home_layout.dart';
import 'package:satc/modules/login/cubit/cubit.dart';
import 'package:satc/modules/login/cubit/login_states.dart';
import 'package:satc/modules/register/register_screen.dart';
import 'package:satc/shared/components/components.dart';
import 'package:satc/shared/contants/constants.dart';
import 'package:satc/widgets/default_button.dart';
import 'package:satc/widgets/default_text.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            buildShowToast(
              text: state.error,
              state: ToastState.ERROR,
            );
          }
          if (state is LoginSuccessState) {
            CacheHelper.saveData(key: "uId", value: state.uId).then((value) {
              uId = state.uId;
              navigateToAndFinish(
                context,
                const HomeLayoutScreen(),
              );
            });
          }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: cubit.fromKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30.0,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: DefaultTextField(
                          enableValidation: true,
                          controller: emailController,
                          textInputType: TextInputType.emailAddress,
                          prefixIcon: Icons.email,
                          label: 'Email',
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: DefaultTextField(
                          enableValidation: true,
                          controller: passwordController,
                          textInputType: TextInputType.visiblePassword,
                          obscureText: true,
                          prefixIcon: Icons.lock,
                          label: 'Password',
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Center(
                        child: ConditionalBuilder(
                          condition: state is! LoginLoadingState,
                          builder: (context) => Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 10.0,
                            ),
                            child: defaultButton(
                              background: Themes.Primary,
                              height: 40,
                              function: () {
                                if (cubit.fromKey.currentState!.validate()) {
                                  cubit.userLogin(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                }
                              },
                              text: 'LOG  IN',
                            ),
                          ),
                          fallback: (context) =>
                              const Center(child: CircularProgressIndicator()),
                        ),
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            const Text(
                              'don\'t have an account ',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 17.0,
                              ),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            OutlinedButton(
                              onPressed: () {
                                navigateTo(
                                  context,
                                  const RegisterScreen(),
                                );
                              },
                              child: const Text(
                                'REGISTER',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                          ],
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
