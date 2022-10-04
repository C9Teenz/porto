import 'package:chat_app/provider/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WidgetAuth extends StatefulWidget {
  const WidgetAuth({Key? key}) : super(key: key);

  @override
  State<WidgetAuth> createState() => _WidgetAuthState();
}

class _WidgetAuthState extends State<WidgetAuth> {
  bool isHidden = true;

  String _username = '';
  String _email = '';
  String _password = '';
  // TextEditingController emailC = TextEditingController();
  // TextEditingController passwordC = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var heightItem = MediaQuery.of(context).size.height;
    var widthItem = MediaQuery.of(context).size.width;
    void _visibility() {
      setState(() {
        isHidden = !isHidden;
      });
    }

    void _trySubmit() {
      bool isValid = _formKey.currentState!.validate();

      if (isValid) {
        _formKey.currentState!.save();
      }
    }

    Auth auth = Provider.of<Auth>(context);
    return SingleChildScrollView(
      child: Center(
        child: Card(
          margin: EdgeInsets.symmetric(
              vertical: heightItem * 0.3, horizontal: widthItem * 0.05),
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    if (auth.isloginScreen)
                      TextFormField(
                        key: const ValueKey('Username'),
                        onSaved: (value) {
                          _username = value!;
                        },
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty || value.length < 4) {
                            return 'username kurang dari 4';
                          }
                        },
                        decoration:
                            InputDecoration(label: const Text('Username')),
                      ),
                    SizedBox(
                      height: heightItem * 0.02,
                    ),
                    TextFormField(
                      key: const ValueKey('Email'),
                      // controller: emailC,
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (value) {
                        _email = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'format email salah';
                        }
                      },
                      decoration: InputDecoration(label: const Text('Email')),
                    ),
                    SizedBox(
                      height: heightItem * 0.02,
                    ),
                    TextFormField(
                      // controller: passwordC,
                      key: const ValueKey('Password'),
                      keyboardType: TextInputType.text,
                      onSaved: (value) {
                        _password = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty || value.length < 6) {
                          return 'password kurang dari 6';
                        }
                      },
                      obscureText: isHidden,
                      decoration: InputDecoration(
                        label: const Text('Password'),
                        suffixIcon: InkWell(
                          onTap: _visibility,
                          child: isHidden
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        auth.isloginScreen
                            ? const Text(
                                'Sudah punya akun?',
                                style: TextStyle(fontSize: 8),
                              )
                            : const Text(
                                'Belum Punya akun?',
                                style: TextStyle(fontSize: 8),
                              ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              auth.changeScreen();
                            });
                          },
                          child: auth.isloginScreen
                              ? const Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: 8, color: Colors.blueAccent),
                                )
                              : const Text(
                                  'Buat akun',
                                  style: TextStyle(
                                      fontSize: 8, color: Colors.blueAccent),
                                ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: heightItem * 0.02,
                    ),
                    Container(
                      width: widthItem * 0.8,
                      child: ElevatedButton(
                          onPressed: () {
                            _trySubmit();
                            auth.submit(_email, _password, _username);
                          },
                          child: auth.isloginScreen
                              ? const Text('Register')
                              : const Text('Login')),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
