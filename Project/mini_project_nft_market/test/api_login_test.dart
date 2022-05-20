import 'package:mini_project_nft_market/services/api/api_login.dart';
import 'package:mini_project_nft_market/services/api/model/login_request.dart';

import 'package:test/test.dart';

void main() {
  test('login return tokens', () async {
    final AuthRepository _authRepository = AuthRepository();

    final _requestData = LoginRequest(
      email: "eve.holt@reqres.in",
      password: "citycmick",
    );
    final result = _authRepository.signInUserWithEmailAndPassword(
        loginRequest: _requestData);

    expect(result.toString().isNotEmpty, true);
  });
}
