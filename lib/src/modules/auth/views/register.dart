import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:position/generated/l10n.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:position/src/core/utils/sizes.dart';
import 'package:position/src/core/utils/tools.dart';
import 'package:position/src/modules/auth/blocs/register/register_bloc.dart';
import 'package:position/src/modules/auth/widgets/appAuthHeader.dart';
import 'package:position/src/modules/auth/widgets/appbottomSheet.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _cpasswordController = TextEditingController();

  bool _obscureText = true;

  bool _obscureCText = true;

  IconData _iconVisible = Icons.visibility_off;

  RegisterBloc? _registerBloc;

  bool get isPopulated =>
      _emailController.text.isNotEmpty &&
      _nameController.text.isNotEmpty &&
      _phoneController.text.isNotEmpty &&
      _passwordController.text.isNotEmpty;

  bool isRegisterButtonEnabled(RegisterState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting!;
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
  void initState() {
    super.initState();
    _registerBloc = BlocProvider.of<RegisterBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
    _cpasswordController.addListener(_onCPasswordChanged);
    _phoneController.addListener(_onPhoneChanged);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _cpasswordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _onEmailChanged() {
    _registerBloc!.add(
      RegisterEmailChanged(email: _emailController.text),
    );
  }

  void _onPasswordChanged() {
    _registerBloc!.add(
      RegisterPasswordChanged(password: _passwordController.text),
    );
  }

  void _onCPasswordChanged() {
    _registerBloc!.add(
      RegisterCPasswordChanged(
          password: _passwordController.text,
          cpassword: _cpasswordController.text),
    );
  }

  void _onPhoneChanged() {
    _registerBloc!.add(
      RegisterPhoneChanged(phone: _phoneController.text),
    );
  }

  void _onFormSubmitted() {
    _registerBloc!.add(
      RegisterSubmitted(
          email: _emailController.text,
          password: _passwordController.text,
          name: _nameController.text,
          phone: _phoneController.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(whiteColor);
    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: BlocListener<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state.isFailure!) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(S.of(context).registerFailed),
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
                        Text(S.of(context).registering),
                        const CircularProgressIndicator(),
                      ],
                    ),
                  ),
                );
            }

            if (state.isSuccess!) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(S.of(context).registerSuccess),
                        const Icon(Icons.check_circle)
                      ],
                    ),
                    backgroundColor: primaryColor,
                    duration: const Duration(seconds: 10),
                  ),
                );
              Navigator.of(context).pop();
            }
          },
          child: BlocBuilder<RegisterBloc, RegisterState>(
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
                          height: 18,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 50, right: 200),
                          child: Text(S.of(context).name,
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
                            controller: _nameController,
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
                        const SizedBox(
                          height: 18,
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
                        !state.isEmailValid!
                            ? Text(
                                S.of(context).invalidEmail,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    color: redColor,
                                    fontSize: 11,
                                    fontFamily: "OpenSans"),
                              )
                            : const Text(""),
                        const SizedBox(
                          height: 18,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 50, right: 200),
                          child: Text(S.of(context).phone,
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
                            controller: _phoneController,
                            autovalidateMode: AutovalidateMode.always,
                            keyboardType: TextInputType.number,
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
                              suffixIcon: Icon(Icons.phone_android,
                                  color: greyColor, size: 20),
                            ),
                          ),
                        ),
                        !state.isPhoneValid!
                            ? Text(
                                S.of(context).invalidPhone,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    color: redColor,
                                    fontSize: 11,
                                    fontFamily: "OpenSans"),
                              )
                            : const Text(""),
                        const SizedBox(
                          height: 18,
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
                          height: 18,
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
                        !state.isCPasswordValid!
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
                          height: 20,
                        ),
                        InkWell(
                          highlightColor: transparent,
                          onTap: isRegisterButtonEnabled(state)
                              ? _onFormSubmitted
                              : null,
                          child: Container(
                              alignment: Alignment.center,
                              width: 130,
                              height: 35,
                              decoration: BoxDecoration(
                                color: isRegisterButtonEnabled(state)
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
                                child: Text(S.of(context).register,
                                    style: TextStyle(
                                      fontFamily: 'OpenSans-Bold',
                                      color: whiteColor,
                                      fontSize: textSize,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                    )),
                              )),
                        ),
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
