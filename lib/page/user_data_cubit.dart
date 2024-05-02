import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/data/user_data.dart';
import 'package:hello_world/page/user_data_state.dart';

import '../domain/user_data.dart';

class UserDataCubit extends Cubit<CustomDataState> {
  UserDataCubit() : super(NoDataState());
  int userIndex = 0;
  UserData? userData;
  changeUserData() async {
    emit(LoadingState());
    userData ??= await UserDataDomain.getUserData();
    User user = userData!.data![userIndex];
    emit(HasDataState(data: user));
    if (userIndex < 5) {
      userIndex++;
    } else {
      userIndex = 0;
    }
  }
}
