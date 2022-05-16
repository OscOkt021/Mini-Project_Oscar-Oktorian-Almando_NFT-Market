import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:email_validator/email_validator.dart';
import 'package:mini_project_nft_market/presentation/dashboard_page/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_nft_market/services/api/model/login_request.dart';
import 'package:mini_project_nft_market/services/auth/cubit/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

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
            const Image(
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
                title: const Text("Error"),
                content: Text(state.errorMessage.toString()),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("OK"))
                ],
              ),
            );
          } else if (state is AuthLoading) {
            // ignore: avoid_print
            print("Loading");
          } else if (state is AuthSuccess) {
            // ignore: avoid_print
            print(state.dataLogin);
            Navigator.of(context).pushReplacement(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return const DashboardPage();
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
                      padding: const EdgeInsets.all(4.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.purple[300],
                          shape: const CircleBorder(),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
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
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      children: [
                        const Center(
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
                            padding: const EdgeInsets.only(bottom: 10),
                            child: TextField(
                              style: const TextStyle(color: Colors.white),
                              controller: widget.usernameC,
                              decoration: InputDecoration(
                                hintText: 'Email',
                                hintStyle: TextStyle(
                                    color: Colors.white.withOpacity(.5)),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 20),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: TextField(
                              style: const TextStyle(color: Colors.white),
                              controller: widget.passwordC,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                    color: Colors.white.withOpacity(.5)),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 20),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: (state is AuthLoading)
                              ? const _loginButtonLoading()
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
      padding: const EdgeInsets.only(bottom: 5),
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
              );
              context.read<AuthCubit>().signInUser(_requestData);
            } else {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Warning"),
                    content: const Text("Email format is not Correct"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("OK"))
                    ],
                  );
                },
              );
            }
          }
        },
        child: const Text("Login"),
      ),
    );
  }
}

// ignore: camel_case_types
class _loginButtonLoading extends StatelessWidget {
  const _loginButtonLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ElevatedButton(
      onPressed: null,
      child: CircularProgressIndicator(),
    );
  }
}
