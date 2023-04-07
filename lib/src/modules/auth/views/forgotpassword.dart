import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:position/generated/l10n.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:position/src/core/utils/sizes.dart';
import 'package:position/src/core/utils/tools.dart';
import 'package:position/src/modules/auth/blocs/login/login_bloc.dart';
import 'package:position/src/modules/auth/widgets/appAuthHeader.dart';
import 'package:position/src/modules/auth/widgets/appbottomSheet.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();

  LoginBloc? _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _onForgotPasswordSubmitted() {
    _loginBloc!.add(
      PasswordForgot(
        email: _emailController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(transparent);
    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.isSend!) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(S.of(context).emailSend),
                        const Icon(Icons.check_circle)
                      ],
                    ),
                    backgroundColor: primaryColor,
                    duration: const Duration(seconds: 5),
                  ),
                );
            }
            if (state.isFailSend!) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(S.of(context).emailNoSend),
                        const Icon(Icons.error)
                      ],
                    ),
                    backgroundColor: redColor,
                  ),
                );
            }
            if (state.isSubmitting!) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(S.of(context).loggin),
                        const CircularProgressIndicator(),
                      ],
                    ),
                  ),
                );
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(color: whiteColor),
                    child: Column(
                      children: [
                        const AppAuthHeader(),
                        const SizedBox(
                          height: 58,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 50, right: 200),
                          child: Text(S.of(context).email,
                              style: TextStyle(
                                fontFamily: 'OpenSans-Bold',
                                color: greyColor,
                                fontSize: textSize,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              )),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 40,
                          margin: const EdgeInsets.only(
                            left: 50,
                            right: 50,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: grey97,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: TextFormField(
                            controller: _emailController,
                            autovalidateMode: AutovalidateMode.always,
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(
                                fontFamily: "OpenSans", fontSize: textSize),
                            autocorrect: false,
                            cursorColor: primaryColor,
                            cursorHeight: 20,
                            decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: transparent)),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: transparent),
                              ),
                              suffixIcon:
                                  Icon(Icons.email, color: greyColor, size: 20),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        InkWell(
                          highlightColor: transparent,
                          onTap: _onForgotPasswordSubmitted,
                          child: Container(
                              alignment: Alignment.center,
                              width: 250,
                              height: 35,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: const [
                                  BoxShadow(
                                      color: shadow1,
                                      offset: Offset(0, 1),
                                      blurRadius: 8,
                                      spreadRadius: 0),
                                  BoxShadow(
                                      color: shadow2,
                                      offset: Offset(0, 3),
                                      blurRadius: 3,
                                      spreadRadius: -2),
                                  BoxShadow(
                                      color: shadow3,
                                      offset: Offset(0, 3),
                                      blurRadius: 4,
                                      spreadRadius: 0)
                                ],
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(S.of(context).sendResetLink,
                                    style: TextStyle(
                                      fontFamily: 'OpenSans-Bold',
                                      color: whiteColor,
                                      fontSize: textSize,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                    )),
                              )),
                        )
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
      bottomSheet: const AppBottomSheet(),
    );
  }
}
