import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:position/generated/l10n.dart';
import 'package:position/src/core/di/di.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:position/src/core/utils/sizes.dart';
import 'package:position/src/core/utils/tools.dart';
import 'package:position/src/modules/auth/blocs/auth/auth_bloc.dart';
import 'package:position/src/modules/auth/blocs/login/login_bloc.dart';
import 'package:position/src/modules/auth/blocs/register/register_bloc.dart';
import 'package:position/src/modules/auth/views/forgotpassword.dart';
import 'package:position/src/modules/auth/views/register.dart';
import 'package:position/src/modules/auth/widgets/appAuthHeader.dart';
import 'package:position/src/modules/auth/widgets/appbottomSheet.dart';
import 'package:position/src/modules/auth/widgets/socialButtons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _identifiantController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  IconData _iconVisible = Icons.visibility_off;

  LoginBloc? _loginBloc;

  bool get isPopulated =>
      _identifiantController.text.isNotEmpty &&
      _passwordController.text.isNotEmpty;

  bool isLoginButtonEnabled(LoginState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting!;
  }

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _identifiantController.addListener(_onLoginIdentifiantChanged);
    _passwordController.addListener(_onLoginPasswordChanged);
  }

  @override
  void dispose() {
    _identifiantController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLoginIdentifiantChanged() {
    _loginBloc!.add(
      LoginIdChanged(identifiant: _identifiantController.text),
    );
  }

  void _onLoginPasswordChanged() {
    _loginBloc!.add(
      LoginPasswordChanged(password: _passwordController.text),
    );
  }

  void _onFormSubmitted() {
    _loginBloc!.add(
      LoginWithCredentialsPressed(
        identifiant: _identifiantController.text,
        password: _passwordController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(whiteColor);
    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.isPasswordVisible!) {
              _iconVisible = Icons.visibility_off;
            }
            if (!state.isPasswordVisible!) {
              _iconVisible = Icons.visibility;
            }
            if (state.isFailure!) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(S.of(context).loginFailed),
                        const Icon(Icons.error)
                      ],
                    ),
                    backgroundColor: redColor,
                    duration: const Duration(seconds: 5),
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

            if (state.isSuccess!) {
              context.read<AuthBloc>().add(AuthLoggedIn());
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const AppAuthHeader(),
                        const SizedBox(
                          height: 58,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 50, right: 256),
                          child: Text(S.of(context).identifiant,
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
                            controller: _identifiantController,
                            autovalidateMode: AutovalidateMode.always,
                            keyboardType: TextInputType.text,
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
                              suffixIcon: Icon(Icons.person,
                                  color: greyColor, size: 20),
                            ),
                          ),
                        ),
                        !state.isIdValid!
                            ? Text(
                                S.of(context).invalidId,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    color: redColor,
                                    fontSize: 11,
                                    fontFamily: "OpenSans"),
                              )
                            : const Text(""),
                        const SizedBox(
                          height: 28,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 50, right: 256),
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
                            obscureText: state.isPasswordVisible!,
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
                                    _loginBloc!.add(LoginPasswordVisibility(
                                        passwordVisibility:
                                            state.isPasswordVisible!));
                                  }),
                            ),
                          ),
                        ),
                        !state.isPasswordValid!
                            ? Text(
                                S.of(context).invalidPass,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    color: redColor,
                                    fontSize: 11,
                                    fontFamily: "OpenSans"),
                              )
                            : const Text(""),
                        const SizedBox(
                          height: 35,
                        ),
                        InkWell(
                          highlightColor: transparent,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return BlocProvider(
                                    create: (context) => getIt<LoginBloc>(),
                                    child: const ForgotPassword(),
                                  );
                                },
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 50, right: 150),
                            child: Text(S.of(context).forgotPass,
                                style: TextStyle(
                                  fontFamily: 'OpenSans-Bold',
                                  color: primaryColor,
                                  fontSize: textSize,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              highlightColor: transparent,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return BlocProvider(
                                        create: (context) =>
                                            getIt<RegisterBloc>(),
                                        child: const RegisterPage(),
                                      );
                                    },
                                  ),
                                );
                              },
                              child: Container(
                                  width: 130,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: whiteColor,
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
                                    child: Text(S.of(context).createAccount,
                                        style: TextStyle(
                                          fontFamily: 'OpenSans-Bold',
                                          color: primaryColor,
                                          fontSize: textSize,
                                          fontWeight: FontWeight.w700,
                                          fontStyle: FontStyle.normal,
                                        )),
                                  )),
                            ),
                            InkWell(
                              highlightColor: transparent,
                              onTap: isLoginButtonEnabled(state)
                                  ? _onFormSubmitted
                                  : null,
                              child: Container(
                                  width: 130,
                                  height: 35,
                                  margin: const EdgeInsets.only(left: 50),
                                  decoration: BoxDecoration(
                                    color: isLoginButtonEnabled(state)
                                        ? primaryColor
                                        : greyColor,
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
                                    child: Text(S.of(context).connexion,
                                        style: TextStyle(
                                          fontFamily: 'OpenSans-Bold',
                                          color: whiteColor,
                                          fontSize: textSize,
                                          fontWeight: FontWeight.w700,
                                          fontStyle: FontStyle.normal,
                                        )),
                                  )),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          S.of(context).or,
                          style: const TextStyle(
                            fontFamily: 'OpenSans-Bold',
                            fontSize: 14,
                            color: greyColor,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          S.of(context).signwith,
                          style: const TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: greyColor,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        buildSocialButtons(_loginBloc),
                        const SizedBox(
                          height: 80,
                        ),
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
