import 'package:api_auth_flutter/helper/colors.dart';
import 'package:api_auth_flutter/helper/extintion.dart';
import 'package:api_auth_flutter/helper/sized.dart';
import 'package:api_auth_flutter/pages/bottom%20nav%20page/bottom_nav_page.dart';
import 'package:api_auth_flutter/pages/sign_up/widgets/button_widget.dart';
import 'package:api_auth_flutter/pages/sign_up/widgets/textfield_widget.dart';
import 'package:api_auth_flutter/pages/signin%20page/bloc/sign_in_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return BlocProvider(
      create: (context) => SignInBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<SignInBloc>();
        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: BlocConsumer<SignInBloc, SignInState>(
              listener: (context, state) {
                if (state is AddSignInState) {
                  context.pushTo(view: const BottomNavScreen());
                }
              },
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Log In",
                      style: TextStyle(
                          fontSize: 30,
                          color: icons,
                          fontWeight: FontWeight.bold),
                    ),
                    gapH30,
                    gapH30,
                    Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Textfield(
                              hintText: "enter your email",
                              textController: emailController,
                            ),
                            gapH10,
                            Textfield(
                              hintText: "enter your password",
                              textController: passwordController,
                              pass: true,
                            ),
                            gapH30,
                            ButtonWidget(
                              title: 'SignIn',
                              onPress: () {
                                if (_formKey.currentState!.validate()) {
                                  bloc.add(AddSignInEvent(
                                      email: emailController.text,
                                      password: passwordController.text));
                                }
                              },
                            )
                          ],
                        )),
                  ],
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
