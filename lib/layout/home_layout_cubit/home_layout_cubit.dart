import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:satc/layout/home_layout_cubit/home_layout_states.dart';
import 'package:satc/model/task_model/task_model.dart';
import 'package:satc/model/user_model/user_model.dart';
import 'package:satc/modules/add_task/add_task_screen.dart';
import 'package:satc/modules/all_worker/all_worker_screen.dart';
import 'package:satc/modules/profile/profile_screen.dart';
import 'package:satc/modules/tasks/tasks_screen.dart';
import 'package:satc/shared/contants/constants.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutStates>{

  HomeLayoutCubit() : super(HomeInitialState());
  // INSTANCE

  static HomeLayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screen = [
    const TasksScreen(),
    const AddTaskScreen(),
    const AllWorkerScreen(),
    const ProfileScreen(),
  ];

  List<String> title = [
    'Tasks',
    'Add Task',
    'All Worker',
    'Profile',
  ];

  List<BottomNavigationBarItem> items = const [
     BottomNavigationBarItem(
      icon: Icon(Icons.task),
      label: "Tasks",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.add),
      label: "Add Tasks",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.group),
      label: "All Worker",
    ),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
  ];


  void changeBottomIndex(int index) {
    // if(index == 1 )
    //   getAllUsers();
    // if (index == 2)
    //   emit(SocialLayoutAddPostState());
    // else {
      currentIndex = index;
      emit(HomeChangeNavState());
    // }
  }

  UserModel? userModel;

  void getUser()
  {
    FirebaseFirestore.instance
        .collection("Users")
        .doc(uId)
        .get()
        .then((value)
    {
      print("User  = "+ value.data().toString());
      print("UID = " + uId.toString());
      userModel = UserModel.fromJson(value.data());
      emit(HomeGetUserSuccessState());
    }).catchError((error) {
      emit(HomeGetUserErrorState(error.toString()));
    });
  }

  void createTask({
    required String specialty,
    required String title,
    required String description,
    required String deadline,
    required String uplodedOn,
  }) {
    emit(HomeLoadingCreateTaskState());

    TaskModel model = TaskModel(
      specialty: specialty,
      title: title,
      deadLine:deadline ,
      description:description ,
      uId: uId,
      uplodedBy:userModel!.name,
      uplodedOn:uplodedOn,
       );
    FirebaseFirestore.instance
        .collection("Tasks")
        .add(model.toMap())
        .then((value) {
      emit(HomeCreateTaskSuccessState(userModel!.uid.toString()));
    }).catchError((error) {
      emit(HomeCreateTaskErrorState(error.toString()));
    });
  }

  TaskModel? taskModel;
  List<TaskModel> tasks = [];
  void getAllTasks()
  {
      FirebaseFirestore.instance
          .collection('Tasks')
          .orderBy('uplodedOn')
          .snapshots()
          .listen((event) {
            tasks =[];
        event.docs.forEach((element)
        {
          tasks.add(TaskModel.fromJson(element.data()));
          taskModel = TaskModel.fromJson(element.data());
        });
      });
  }

List<UserModel> users =[];
  void getAllUser()
  {
    print("getAllUser ");

    if(users.isEmpty) {
      print("getAllUser ********");
      FirebaseFirestore.instance
          .collection('Users')
          .get()
          .then((value) {
        value.docs.forEach((element)
        {
          if(element.data()['uid'] != userModel!.uid) {
            users.add(UserModel.fromJson(element.data()));
          }
          emit(HomeGetAllUserSuccessState());
        });
      })
          .catchError((error) {
        emit(HomeGetAllUserErrorState(error.toString()));
      });
    }
  }
}