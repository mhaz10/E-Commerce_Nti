import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repo/auth_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepoImplementation) : super(RegisterInitialState());

  final AuthRepo authRepoImplementation;

  static RegisterCubit get(context) => BlocProvider.of(context);

  void register({
    required String username,
    required String password,
    required String email,
    required String phone,
    image,
  }) async {
    emit(RegisterLoadingState());

    var result = await authRepoImplementation.register(
      username: username,
      password: password,
      email: email,
      phone: phone
    );
    result.fold(
      (String error) {
        emit(RegisterFailureState(error));
      },
      (r) {
        emit(RegisterSuccessState());
      },
    );
  }
}
