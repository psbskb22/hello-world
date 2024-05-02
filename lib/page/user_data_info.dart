import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import '../data/user_data.dart';
import 'user_data_cubit.dart';
import 'user_data_state.dart';

class UserDataInfo extends StatelessWidget {
  const UserDataInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserDataCubit(),
      child: const Scaffold(body: UserDataWidget()),
    );
  }
}

class UserDataWidget extends StatelessWidget {
  const UserDataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: BlocBuilder<UserDataCubit, CustomDataState>(
                builder: (context, dataState) {
                  if (dataState is NoDataState) {
                    return const Text('Press Below to Change the User Data');
                  }
                  if (dataState is HasDataState) {
                    User user = dataState.data;
                    return Text(
                      '${user.firstName} ${user.lastName}',
                      style: Theme.of(context).textTheme.titleLarge,
                    );
                  }
                  return const Center(
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  );
                },
              ),
            ),
          ),
          MaterialButton(
            elevation: 0,
            color: Theme.of(context).colorScheme.primary,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            onPressed: () {
              context.read<UserDataCubit>().changeUserData();
            },
            child: Text(
              'Change User Data',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
