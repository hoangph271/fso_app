import 'package:flutter/material.dart';
import 'package:fso_app/forms/login_form.dart';
import 'package:fso_app/fso_auth_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => FsoAuthModel(),
    child: const FsoApp(),
  ));
}

class FsoApp extends StatelessWidget {
  const FsoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FsoAuthModel>(builder: (context, authModel, _) {
      return MaterialApp(
        title: 'Flutter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(
          onSigninClicked: () {
            authModel.signin('username');
          },
        ),
      );
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.onSigninClicked}) : super(key: key);
  final VoidCallback onSigninClicked;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FsoAuthModel>(
      builder: (_, authModel, ___) {
        return Scaffold(
          appBar: AppBar(
            title: Text(authModel.username() ?? 'NOT Signed in'),
          ),
          body: Center(
            child: authModel.isAuthed()
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(authModel.username() ?? 'NOT signed in'),
                      TextButton(
                          onPressed: () {
                            if (authModel.isAuthed()) {
                              authModel.signout();
                            } else {
                              authModel.signin('username');
                            }
                          },
                          child: Text(
                              authModel.isAuthed() ? 'Sign out' : 'Sign in'))
                    ],
                  )
                : LoginForm(
                    onSignIn: (username) {
                      if (authModel.isAuthed()) {
                        authModel.signout();
                      } else {
                        authModel.signin(username);
                      }
                    },
                  ),
          ),
        );
      },
    );
  }
}
