import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_app_ui/config/constants.dart';
import 'package:game_app_ui/models/custom_appbar.dart';
import 'package:game_app_ui/models/hero_detail_widget.dart';
import 'package:game_app_ui/models/hero_model.dart';

class HeroDetailScreen extends StatelessWidget {
  final HeroModel heroModel;
  const HeroDetailScreen({Key? key, required this.heroModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              yellowBright,
              pinkBright,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            HeroDetailWidget(heroModel: heroModel),
            // Add Custom Appbar
            const CustomAppBar(),
          ],
        ),
      ),
    );
  }
}
