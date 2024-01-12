// ignore_for_file: library_private_types_in_public_api, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:position/generated/l10n.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:position/src/core/utils/styles.dart';
import 'package:position/src/core/utils/tools.dart';
import 'package:position/src/modules/auth/blocs/auth/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  // Cette méthode construit les indicateurs de page pour le widget PageView
  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  // Cette méthode construit un indicateur de page pour le widget PageView
  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : accentColor,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(primaryColor); // Change la couleur de la barre de statut
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                primaryColor,
                primaryColor,
                primaryColor,
                primaryDarkColor
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // Bouton "Passer" pour passer à la dernière page de l'écran d'introduction
                Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => {
                      setState(() {
                        _currentPage = 2;
                      })
                    },
                    child: Text(
                      S.of(context).skip,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                // Widget PageView pour afficher les pages d'introduction
                SizedBox(
                  height: 600.0,
                  child: PageView(
                    physics: const ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      // Première page d'introduction
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/png/services-fr.png',
                                ),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                            const SizedBox(height: 30.0),
                            Text(
                              S.of(context).title1,
                              style: kTitleStyle,
                            ),
                            const SizedBox(height: 15.0),
                            Text(
                              S.of(context).subtitle1,
                              style: kSubtitleStyle,
                            ),
                          ],
                        ),
                      ),
                      // Deuxième page d'introduction
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/png/marketplace-fr.png',
                                ),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                            const SizedBox(height: 30.0),
                            Text(
                              S.of(context).title2,
                              style: kTitleStyle,
                            ),
                            const SizedBox(height: 15.0),
                            Text(
                              S.of(context).subtitle2,
                              style: kSubtitleStyle,
                            ),
                          ],
                        ),
                      ),
                      // Troisième page d'introduction
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/png/events-fr.png',
                                ),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                            const SizedBox(height: 30.0),
                            Text(
                              S.of(context).title3,
                              style: kTitleStyle,
                            ),
                            const SizedBox(height: 15.0),
                            Text(
                              S.of(context).subtitle3,
                              style: kSubtitleStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Indicateurs de page pour le widget PageView
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                // Bouton "Suivant" pour passer à la page suivante de l'écran d'introduction
                _currentPage != _numPages - 1
                    ? Expanded(
                        child: Align(
                          alignment: FractionalOffset.bottomRight,
                          child: TextButton(
                            onPressed: () {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  S.of(context).next,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 22.0,
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : const Text(''),
              ],
            ),
          ),
        ),
      ),
      // Bouton "Commencer" pour passer à l'écran de connexion
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              height: 100.0,
              width: double.infinity,
              color: primaryDarkColor,
              child: GestureDetector(
                onTap: () => context.read<AuthBloc>().add(AuthFirst()),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Text(
                      S.of(context).go,
                      style: const TextStyle(
                        color: accentColor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            )
          : const Text(''),
    );
  }
}
