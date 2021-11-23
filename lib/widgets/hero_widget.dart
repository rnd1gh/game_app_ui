import 'package:flutter/material.dart';
import 'package:game_app_ui/config/constants.dart';
import 'package:game_app_ui/config/helper.dart';
import 'package:game_app_ui/models/hero_model.dart';
import 'package:game_app_ui/screens/hero_detail_screen.dart';
import 'package:game_app_ui/widgets/attribute_widget.dart';

class HeroWidget extends StatelessWidget {
  final HeroModel heroModel;
  const HeroWidget({
    Key? key,
    required this.heroModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform.translate(
            offset: const Offset(-10, 0),
            child: Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.01)
                ..rotateY(
                  radians(1.5), // rotate 1.5 degree
                ),
              child: Container(
                height: 216,
                margin: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding * 2,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(22.0),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: const Offset(-40, 0),
            child: Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.01)
                ..rotateY(
                  radians(8),
                ), // rotate 8 degree
              child: Container(
                height: 188,
                margin: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding * 2,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(22.0),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Transform.translate(
              offset: const Offset(-30, 0),
              // support Hero animation
              child: Hero(
                tag: heroModel.name,
                child: Image.asset(heroModel.image),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: kDefaultPadding * 2,
              ),
              margin: const EdgeInsets.only(
                right: kDefaultPadding * 3,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Build Attribute Widget
                  AttributeWidget(
                    percent: heroModel.health,
                    child: Image.asset(heartImgUrl),
                  ),
                  AttributeWidget(
                    percent: heroModel.speed,
                    child: Image.asset(speedImgUrl),
                  ),
                  AttributeWidget(
                    percent: heroModel.attack,
                    child: Image.asset(knifeImgUrl),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return HeroDetailScreen(heroModel: heroModel);
                          },
                        ),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                    ),
                    child: const Text(
                      'See Details',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
