import 'package:api_auth_flutter/helper/colors.dart';
import 'package:api_auth_flutter/helper/extintion.dart';
import 'package:api_auth_flutter/helper/sized.dart';
import 'package:api_auth_flutter/pages/signin%20page/sign_in.dart';
import 'package:api_auth_flutter/pages/sign_up/bloc/sign_up_bloc.dart';
import 'package:api_auth_flutter/pages/sign_up/widgets/button_widget.dart';
import 'package:api_auth_flutter/pages/sign_up/widgets/image_pick.dart';
import 'package:api_auth_flutter/pages/sign_up/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<SignUpBloc>();

        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocConsumer<SignUpBloc, SignUpState>(
                  listener: (context, state) {
                    if (state is LoadingState) {
                      showDialog(
                          barrierDismissible: false,
                          barrierColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            return const AlertDialog(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              content: SizedBox(
                                height: 80,
                                width: 80,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            );
                          });
                    }
                    if (state is SuccessState) {
                      Navigator.pop(context);
                      context.pushTo(view: SignIn());
                    }
                    if (state is UpdateImageState) {
                      Navigator.pop(context);
                    }
                    if (state is ErrorState) {
                      Navigator.pop(context);
                      context.getDialog(content: 'thera was an error');
                    }
                  },
                  builder: (context, state) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sign Up",
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
                              children: [
                                ImageAvatar(
                                  isSelected: bloc.chosen,
                                  selectedPath: bloc.image,
                                  onTap: () async {
                                    bloc.add(ChangeImageEvent());
                                  },
                                ),
                                gapH30,
                                gapH10,
                                Textfield(
                                  hintText: "enter your name",
                                  textController: nameController,
                                ),
                                gapH10,
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
                                gapH10,
                                gapH30,
                                ButtonWidget(
                                  title: 'Sign Up',
                                  onPress: () {
                                    if (_formKey.currentState!.validate()) {
                                      if (bloc.chosen) {
                                        bloc.add(CreateAccountEvent(
                                            email: emailController.text,
                                            name: nameController.text,
                                            password: passwordController.text));
                                      }
                                    }
                                  },
                                )
                              ],
                            )),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
