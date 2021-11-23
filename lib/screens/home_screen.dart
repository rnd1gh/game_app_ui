import 'package:flutter/material.dart';
import 'package:game_app_ui/config/constants.dart';
import 'package:game_app_ui/models/hero_model.dart';
import 'package:game_app_ui/widgets/hero_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              orangeSoft,
              violetSoft,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.only(
            top: kDefaultFatPadding,
            bottom: kDefaultFatPadding,
          ),
          itemCount: heroes.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                bottom: kDefaultPadding,
              ),
              child: HeroWidget(
                heroModel: heroes[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
