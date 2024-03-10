import 'package:api_auth_flutter/helper/colors.dart';
import 'package:api_auth_flutter/helper/extintion.dart';
import 'package:api_auth_flutter/helper/sized.dart';
import 'package:api_auth_flutter/pages/category%20page/bloc/category_bloc.dart';
import 'package:api_auth_flutter/pages/category%20page/search/widgets/textfield_category_widget.dart';
import 'package:api_auth_flutter/pages/category%20page/search_page.dart';
import 'package:api_auth_flutter/pages/category%20page/widgets/image_Category_picker.dart';
import 'package:api_auth_flutter/pages/home%20page/widgets/button_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonCategoryWidgets extends StatelessWidget {
  ButtonCategoryWidgets({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryBloc(),
      child: Builder(builder: (context) {
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
                        BlocProvider(
                          create: (context) => CategoryBloc(),
                          child: Builder(builder: (context) {
                            final bloc = context.read<CategoryBloc>();
                            return BlocConsumer<CategoryBloc, CategoryState>(
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
                                              child:
                                                  CircularProgressIndicator(),
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
                                  context.getDialog(
                                      content: 'there was an error');
                                }
                              },
                              builder: (context, state) {
                                return Form(
                                    key: _formKey,
                                    child: Column(
                                      children: [
                                        ImageCategoryChosen(
                                          isSelected: bloc.chosen,
                                          selectedPath: bloc.image,
                                          onTap: () async {
                                            bloc.add(ChangeImageEvent());
                                          },
                                        ),
                                        gapH30,
                                        gapH10,
                                        TextfieldCategory(
                                          hintText: "enter the name:",
                                          textController: name,
                                        ),
                                        gapH10,
                                        gapH30,
                                        ButtonCreateWidget(
                                          title: 'Create Category',
                                          onPress: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              if (bloc.chosen) {
                                                bloc.add(
                                                  CreateCategoryEvent(
                                                      name: name.text),
                                                );
                                                Navigator.pop(context);
                                              }
                                            }
                                          },
                                        )
                                      ],
                                    ));
                              },
                            );
                          }),
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
