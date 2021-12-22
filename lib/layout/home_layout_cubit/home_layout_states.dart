abstract class HomeLayoutStates{}

class HomeInitialState extends HomeLayoutStates{}

class HomeChangeNavState extends HomeLayoutStates {}

// get User
class HomeGetUserSuccessState extends HomeLayoutStates {}

class HomeGetUserErrorState extends HomeLayoutStates {
  final String error;
  HomeGetUserErrorState(this.error);
}

// get User
class HomeGetAllUserSuccessState extends HomeLayoutStates {}

class HomeGetAllUserErrorState extends HomeLayoutStates {
  final String error;
  HomeGetAllUserErrorState(this.error);
}

// Create a Task
class HomeLoadingCreateTaskState extends HomeLayoutStates {}

class HomeCreateTaskSuccessState extends HomeLayoutStates {
  final String uId;
  HomeCreateTaskSuccessState(this.uId);
}

class HomeCreateTaskErrorState extends HomeLayoutStates {
  final String error;
  HomeCreateTaskErrorState(this.error);
}

// Create a Task
class HomeLoadingGetAllTaskState extends HomeLayoutStates {}

class HomeGetAllTaskSuccessState extends HomeLayoutStates {}

class HomeGetAllTaskErrorState extends HomeLayoutStates {
  final String error;
  HomeGetAllTaskErrorState(this.error);
}

