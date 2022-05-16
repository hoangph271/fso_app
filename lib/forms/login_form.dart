import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key? key, required this.onSignIn}) : super(key: key);
  final void Function(String) onSignIn;
  final TextEditingController usernameController = TextEditingController();

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: widget.usernameController,
              decoration: const InputDecoration(
                  hintText: 'Username', icon: Icon(Icons.person_outline)),
            ),
            TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Password', icon: Icon(Icons.password_outlined)),
            ),
            ValueListenableBuilder<TextEditingValue>(
                valueListenable: widget.usernameController,
                builder: (_, value, __) {
                  return ElevatedButton(
                      onPressed: value.text.isEmpty
                          ? null
                          : () {
                              widget.onSignIn(widget.usernameController.text);
                            },
                      child: const Text('Sign in'));
                })
          ],
        ),
      ),
    );
  }
}
