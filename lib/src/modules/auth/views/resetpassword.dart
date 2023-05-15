import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:position/generated/l10n.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:position/src/core/utils/sizes.dart';
import 'package:position/src/core/utils/tools.dart';
import 'package:position/src/modules/auth/blocs/login/login_bloc.dart';
import 'package:position/src/modules/auth/widgets/appAuthHeader.dart';
import 'package:position/src/modules/auth/widgets/appbottomSheet.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key, @required this.token});
  final String? token;

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _cpasswordController = TextEditingController();

  bool _obscureText = true;

  bool _obscureCText = true;

  IconData _iconVisible = Icons.visibility_off;

  LoginBloc? _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _cpasswordController.dispose();
    super.dispose();
  }

  void _onResetPasswordSubmitted() {
    _loginBloc!.add(
      PasswordReset(
          email: _emailController.text,
          password: _passwordController.text,
          resettoken: widget.token!),
    );
    Navigator.pop(context);
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
      if (_obscureText == true) {
        _iconVisible = Icons.visibility_off;
      } else {
        _iconVisible = Icons.visibility;
      }
    });
  }

  void _toggleObscureCText() {
    setState(() {
      _obscureCText = !_obscureCText;
      if (_obscureCText == true) {
        _iconVisible = Icons.visibility_off;
      } else {
        _iconVisible = Icons.visibility;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(transparent);
    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.isResetPassword!) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(S.of(context).resetsuccess),
                        const Icon(Icons.check_circle)
                      ],
                    ),
                    backgroundColor: primaryColor,
                    duration: const Duration(seconds: 5),
                  ),
                );
            }
            if (state.isFailedResetPassword!) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(S.of(context).error),
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
                          height: 28,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 50, right: 200),
                          child: Text(S.of(context).password,
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
                            controller: _passwordController,
                            autovalidateMode: AutovalidateMode.always,
                            keyboardType: TextInputType.text,
                            autocorrect: false,
                            cursorColor: primaryColor,
                            cursorHeight: 20,
                            obscureText: _obscureText,
                            style: TextStyle(
                                fontFamily: "OpenSans", fontSize: textSize),
                            decoration: InputDecoration(
                              focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: transparent)),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: transparent),
                              ),
                              suffixIcon: IconButton(
                                  icon: Icon(_iconVisible,
                                      color: greyColor, size: 20),
                                  onPressed: () {
                                    _toggleObscureText();
                                  }),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 28,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 50, right: 150),
                          child: Text(S.of(context).cpassword,
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
                            controller: _cpasswordController,
                            autovalidateMode: AutovalidateMode.always,
                            keyboardType: TextInputType.text,
                            autocorrect: false,
                            cursorColor: primaryColor,
                            cursorHeight: 20,
                            obscureText: _obscureCText,
                            style: TextStyle(
                                fontFamily: "OpenSans", fontSize: textSize),
                            decoration: InputDecoration(
                              focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: transparent)),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: transparent),
                              ),
                              suffixIcon: IconButton(
                                  icon: Icon(_iconVisible,
                                      color: greyColor, size: 20),
                                  onPressed: () {
                                    _toggleObscureCText();
                                  }),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        InkWell(
                          highlightColor: transparent,
                          onTap: _onResetPasswordSubmitted,
                          child: Container(
                              alignment: Alignment.center,
                              width: 200,
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
                                child: Text(S.of(context).resetPassword,
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
