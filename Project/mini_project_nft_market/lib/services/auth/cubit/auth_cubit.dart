import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mini_project_nft_market/services/api/api_login.dart';
import 'package:mini_project_nft_market/services/api/model/login_request.dart';
import 'package:mini_project_nft_market/services/api/model/login_respond.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  AuthRepository _authRepository = AuthRepository();

  void signInUser(LoginRequest loginRequest) async {
    emit(AuthLoading());

    try {
      final _data = await _authRepository.signInUserWithEmailAndPassword(
        loginRequest: loginRequest,
      );

      _data.fold(
        (l) => emit(AuthError(l)),
        (r) => emit(AuthSuccess(r)),
      );
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
