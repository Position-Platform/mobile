// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppAuthHeader extends StatelessWidget {
  const AppAuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    // Récupère la taille de l'écran
    final Size screenSize = MediaQuery.of(context).size;
    // Calcule la hauteur du logo en fonction de la taille de l'écran
    final double logoHeight = screenSize.height * 0.1;
    // Calcule la largeur du logo en fonction de la taille de l'écran
    final double logoWidth = screenSize.width * 0.5;
    // Calcule la marge horizontale du message de bienvenue en fonction de la taille de l'écran
    final double welcomeMargin = screenSize.width * 0.1;

    // Retourne une colonne contenant le logo et le message de bienvenue
    return Column(
      children: [
        // Ajoute un espace entre le haut de l'écran et le logo
        SizedBox(
          height: screenSize.height * 0.05,
        ),
        // Affiche le logo de l'application
        Image.asset(
          "assets/images/png/logo-nom.png",
          height: logoHeight,
          width: logoWidth,
        ),
        // Ajoute un espace entre le logo et le message de bienvenue
        SizedBox(
          height: screenSize.height * 0.02,
        ),
        // Affiche le message de bienvenue
        Container(
          margin: EdgeInsets.symmetric(horizontal: welcomeMargin),
          child: SvgPicture.asset("assets/images/svg/welcome-large.svg"),
        ),
      ],
    );
  }
}
