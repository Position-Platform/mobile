import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:position/generated/l10n.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:position/src/core/utils/tools.dart';
import 'package:position/src/modules/auth/widgets/appbottomSheet.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _identifiantController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool _obscureText = true;

  IconData _iconVisible = Icons.visibility_off;

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

  @override
  Widget build(BuildContext context) {
    changeStatusColor(transparent);
    return Scaffold(
      backgroundColor: whiteColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(color: whiteColor),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Image.asset(
              "assets/images/png/logo-nom.png",
              height: 56,
              width: 150,
            ),
            const SizedBox(
              height: 57,
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 50,
                right: 50,
              ),
              child: SvgPicture.asset("assets/images/svg/welcome-large.svg"),
            ),
            const SizedBox(
              height: 58,
            ),
            Container(
              margin: const EdgeInsets.only(left: 50, right: 256),
              child: Text(S.of(context).identifiant,
                  style: const TextStyle(
                    fontFamily: 'OpenSans-Bold',
                    color: greyColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              height: 50,
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
                autocorrect: false,
                cursorColor: primaryColor,
                cursorHeight: 30,
                decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: transparent)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: transparent),
                  ),
                  suffixIcon: Icon(Icons.person, color: greyColor, size: 20),
                ),
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            Container(
              margin: const EdgeInsets.only(left: 50, right: 256),
              child: Text(S.of(context).password,
                  style: const TextStyle(
                    fontFamily: 'OpenSans-Bold',
                    color: greyColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              height: 50,
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
                cursorHeight: 30,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: transparent)),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: transparent),
                  ),
                  suffixIcon: IconButton(
                      icon: Icon(_iconVisible, color: greyColor, size: 20),
                      onPressed: () {
                        _toggleObscureText();
                      }),
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Container(
              margin: const EdgeInsets.only(left: 50, right: 200),
              child: Text(S.of(context).forgotPass,
                  style: const TextStyle(
                    fontFamily: 'OpenSans-Bold',
                    color: primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  )),
            ),
            const SizedBox(
              height: 60,
            ),
            Row(
              children: [
                Container(
                    width: 140,
                    height: 45,
                    margin: const EdgeInsets.only(
                      left: 50,
                    ),
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
                          style: const TextStyle(
                            fontFamily: 'OpenSans-Bold',
                            color: primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          )),
                    )),
                Container(
                    width: 140,
                    height: 45,
                    margin: const EdgeInsets.only(left: 67),
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
                      child: Text(S.of(context).connexion,
                          style: const TextStyle(
                            fontFamily: 'OpenSans-Bold',
                            color: whiteColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          )),
                    )),
              ],
            )
          ],
        ),
      ),
      bottomSheet: AppBottomSheet(),
    );
  }
}
