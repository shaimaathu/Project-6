import 'package:api_auth_flutter/helper/colors.dart';
import 'package:api_auth_flutter/helper/extintion.dart';
import 'package:api_auth_flutter/helper/sized.dart';
import 'package:api_auth_flutter/pages/category%20page/search/widgets/textfield_category_widget.dart';
import 'package:api_auth_flutter/pages/category%20page/search_page.dart';
import 'package:api_auth_flutter/pages/home%20page/bloc/home_bloc.dart';
import 'package:api_auth_flutter/pages/home%20page/widgets/button_product_widget.dart';
import 'package:api_auth_flutter/pages/home%20page/widgets/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonWidgets extends StatelessWidget {
  ButtonWidgets({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController categoryIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<HomeBloc>();
        return FloatingActionButton(
            backgroundColor: icons,
            tooltip: 'add product',
            elevation: 3,
            shape: const CircleBorder(
                eccentricity: 1,
                side: BorderSide(color: Colors.white, width: 2)),
            child: const Icon(Icons.add_sharp,
                color: Colors.white,
                size: 55,
                shadows: [
                  BoxShadow(
                      blurStyle: BlurStyle.inner,
                      color: Colors.grey,
                      spreadRadius: 30,
                      offset: Offset.infinite)
                ]),
            onPressed: () {
              showModalBottomSheet<void>(
                isScrollControlled: true,
                barrierColor: Colors.white.withOpacity(0),
                context: context,
                elevation: 10,
                builder: (BuildContext context) {
                  return Container(
                    height: context.getHeight() * 0.98,
                    width: context.getWidth(),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(5, 5),
                              spreadRadius: 10,
                              blurRadius: 20,
                              blurStyle: BlurStyle.normal)
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BlocConsumer<HomeBloc, HomeState>(
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
                              context.pushTo(view: const SearchPage());
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
                            return Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    ImageCategory(
                                      isSelected: bloc.chosen,
                                      selectedPath: bloc.image,
                                      onTap: () async {
                                        bloc.add(ChangeImageEvent());
                                      },
                                    ),
                                    gapH30,
                                    gapH10,
                                    TextfieldCategory(
                                      hintText: "enter the title:",
                                      textController: titleController,
                                    ),
                                    gapH10,
                                    TextfieldCategory(
                                      hintText: "enter the price:",
                                      textController: priceController,
                                    ),
                                    gapH10,
                                    TextfieldCategory(
                                      hintText: "enter the description",
                                      textController: descriptionController,
                                    ),
                                    gapH10,
                                    gapH30,
                                    ButtonCreateWidget(
                                      title: 'Sign Up',
                                      onPress: () {
                                        if (_formKey.currentState!.validate()) {
                                          if (bloc.chosen) {
                                            bloc.add(
                                              CreateAccountEvent(
                                                  categoryId: int.parse(
                                                      categoryIdController
                                                          .text),
                                                  description:
                                                      descriptionController
                                                          .text,
                                                  price: int.parse(
                                                      priceController.text),
                                                  title: titleController.text),
                                            );
                                            Navigator.pop(context);
                                          }
                                        }
                                      },
                                    )
                                  ],
                                ));
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            });
      }),
    );
  }
}
