import 'package:flutter/material.dart';
import 'package:game_app_ui/config/constants.dart';
import 'package:game_app_ui/models/hero_model.dart';

class HeroDetailWidget extends StatelessWidget {
  const HeroDetailWidget({
    Key? key,
    required this.heroModel,
  }) : super(key: key);

  final HeroModel heroModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80 + kDefaultPadding),
      child: Column(
        children: [
          _HeroBanner(heroModel: heroModel),
          // Add Hero Name
          _HeroName(heroModel: heroModel),
          // Add descriptions
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kDefaultWidePadding,
              vertical: kDefaultThinPadding,
            ),
            child: Text(
              heroModel.desciption,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // Add Button
          const SizedBox(height: kDefaultPadding),
          Row(
            children: [
              const SizedBox(width: kDefaultPadding),
              Expanded(
                child: SizedBox(
                  height: 56.0,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: const Text(
                      'Add Favorite',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: kDefaultPadding),
              Expanded(
                child: SizedBox(
                  height: 56.0,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      padding: const EdgeInsets.all(0.0),
                    ),
                    child: Ink(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            yellowBright,
                            pinkBright,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        child: const Text(
                          'OK',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: kDefaultPadding),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeroName extends StatelessWidget {
  const _HeroName({
    Key? key,
    required this.heroModel,
  }) : super(key: key);

  final HeroModel heroModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 86.0,
      width: double.infinity,
      margin: const EdgeInsets.only(
        top: kDefaultExThinPadding,
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              heroModel.name,
              style: const TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: kDefaultPadding,
              ),
              child: Text(
                heroModel.name,
                style: TextStyle(
                  fontSize: 56,
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroBanner extends StatelessWidget {
  const _HeroBanner({
    Key? key,
    required this.heroModel,
  }) : super(key: key);

  final HeroModel heroModel;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.only(
          top: kDefaultWidePadding,
          left: kDefaultWidePadding,
          right: kDefaultWidePadding,
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(
                  top: kDefaultPadding,
                  left: kDefaultPadding,
                  right: kDefaultPadding,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22.0),
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsetsDirectional.all(
                  kDefaultThinPadding,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22.0),
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsetsDirectional.only(
                  bottom: kDefaultPadding,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22.0),
                  color: Colors.white.withOpacity(0.4),
                ),
                child: Center(
                  child: Hero(
                    tag: heroModel.name,
                    child: Image.asset(heroModel.image),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
