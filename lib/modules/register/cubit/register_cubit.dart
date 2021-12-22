import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:satc/model/user_model/user_model.dart';
import 'package:satc/modules/register/cubit/register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  // INSTANCE
  static RegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String name,
    required String specialty,
    required String email,
    required String password,
  }) {
    emit(RegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      createUser(
        name: name,
        specialty: specialty,
        email: email,
        uid: value.user!.uid,
      );
    }).catchError((error) {
      emit(RegisterErrorState(error.toString()));
    });
  }

  void createUser({
    required String name,
    required String specialty,
    required String email,
    required String uid,
  }) {
    UserModel model = UserModel(
      name: name,
      specialty: specialty,
      email: email,
      uid: uid,
      image: 'https://images.pexels.com/photos/4064839/pexels-photo-4064839.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    );

    FirebaseFirestore.instance
        .collection("Users")
        .doc(uid)
        .set(model.toMap())
        .then((value) {
      emit(CreateUserSuccessState(uid));
    }).catchError((error) {
      emit(CreateUserErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changeIconSuffix() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterChangePasswordVisibilityState());
  }
}