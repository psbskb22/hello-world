class CustomDataState {}

class NoDataState extends CustomDataState {}

class LoadingState extends CustomDataState {}

class HasDataState extends CustomDataState {
  final dynamic data;

  HasDataState({required this.data});
}
