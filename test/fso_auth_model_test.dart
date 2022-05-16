import 'package:fso_app/fso_auth_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const username = 'username';

  test('Should init with isAuthed false', () {
    final authModel = FsoAuthModel();

    expect(authModel.isAuthed(), false);
  });

  test('Should signin correctly', () {
    final authModel = FsoAuthModel();
    authModel.signin(username);

    expect(authModel.isAuthed(), true);
  });

  test('Should signout correctly', () {
    final authModel = FsoAuthModel();
    authModel.signin(username);
    authModel.signout();

    expect(authModel.isAuthed(), false);
  });
}
