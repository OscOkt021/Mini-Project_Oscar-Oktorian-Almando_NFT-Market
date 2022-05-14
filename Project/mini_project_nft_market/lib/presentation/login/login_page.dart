import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:email_validator/email_validator.dart';
import 'package:mini_project_nft_market/presentation/dashboard_page/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_nft_market/services/api/model/login_request.dart';
import 'package:mini_project_nft_market/services/auth/cubit/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameC = TextEditingController();

  final passwordC = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image(
              image: AssetImage("assets/images/bg/bg1.jpg"),
              fit: BoxFit.cover,
            ),
            Login(usernameC: usernameC, passwordC: passwordC),
          ],
        ),
      ),
    );
  }
}

class Login extends StatefulWidget {
  const Login({
    Key? key,
    required this.usernameC,
    required this.passwordC,
  }) : super(key: key);
  // GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController usernameC;
  final TextEditingController passwordC;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Error"),
                content: Text(state.errorMessage.toString()),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("OK"))
                ],
              ),
            );
          } else if (state is AuthLoading) {
            print("Loading");
          } else if (state is AuthSuccess) {
            print(state.dataLogin);
            Navigator.of(context).pushReplacement(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return DashboardPage();
                },
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  final tween = Tween(begin: 0.0, end: 1.0);

                  return FadeTransition(
                    opacity: animation.drive(tween),
                    child: child,
                  );
                },
              ),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.purple[300],
                          shape: CircleBorder(),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.navigate_before,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * (5 / 100),
                ),
                BlurryContainer(
                  blur: 4,
                  borderRadius: BorderRadius.circular(20),
                  height: 400,
                  width: MediaQuery.of(context).size.width - 20,
                  child: Center(
                    child: ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      children: [
                        Center(
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Hero(
                              tag: 'hero',
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Saira Condensed",
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              controller: widget.usernameC,
                              decoration: InputDecoration(
                                hintText: 'Email',
                                hintStyle: TextStyle(
                                    color: Colors.white.withOpacity(.5)),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 20),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              controller: widget.passwordC,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                    color: Colors.white.withOpacity(.5)),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 20),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: (state is AuthLoading)
                              ? _loginButtonLoading()
                              : Logins(
                                  usernameC: widget.usernameC,
                                  passwordC: widget.passwordC,
                                ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class Logins extends StatelessWidget {
  const Logins({
    Key? key,
    required this.usernameC,
    required this.passwordC,
  }) : super(key: key);

  final TextEditingController usernameC;
  final TextEditingController passwordC;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          if ((usernameC.text != "" && passwordC.text != "")) {
            if (EmailValidator.validate(usernameC.text)) {
              final _requestData = LoginRequest(
                email: usernameC.text,
                password: passwordC.text,
                // email: "eve.holt@reqres.in",
                // password: "terserah",
              );
              context.read<AuthCubit>().signInUser(_requestData);
            } else {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Warning"),
                    content: Text("Email format is not Correct"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("OK"))
                    ],
                  );
                },
              );
            }
          }
        },
        child: Text("Login"),
      ),
    );
  }
}

class _loginButtonLoading extends StatelessWidget {
  const _loginButtonLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: null,
      child: CircularProgressIndicator(),
    );
  }
}
