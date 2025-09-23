class HomeState {}

class Homeinit extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccesState extends HomeState {}

class HomeErrorState extends HomeState {
  final String message;
  HomeErrorState({required this.message});
}
