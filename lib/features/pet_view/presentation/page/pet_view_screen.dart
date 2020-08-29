import 'package:flutter/material.dart';
import 'package:mel/core.dart' show cPinkLight, cWhite;
import 'package:mel/features/pet_view.dart'
    show
        PetViewAdoptButton,
        PetViewFavoriteButton,
        PetViewInfo,
        PetViewInterests,
        PetViewOwner,
        PetViewPhotos;
import 'package:mel/widgets.dart' show TextSSerif, BackArrow;

class PetViewScreen extends StatefulWidget {
  @override
  _PetViewScreenState createState() => _PetViewScreenState();
}

class _PetViewScreenState extends State<PetViewScreen> {
  final ScrollController controller = ScrollController();
  double fontSize = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Colors.white,
                  cPinkLight,
                ],
                tileMode: TileMode.clamp,
              ).createShader(bounds);
            },
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: cWhite,
            ),
          ),
          Stack(
            children: [
              Column(
                children: [
                  PetViewPhotos(),
                  SizedBox(
                    height: 80,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                TextSSerif(
                                  'Doggo',
                                  textStyle: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                TextSSerif(
                                  'Bonfim, Porto',
                                  textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black45,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        PetViewInterests(),
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      child: TextSSerif(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse sollicitudin ipsum at nibh varius, at vulputate eros hendrerit. Quisque augue ex.',
                      )),
                  _petInfos(),
                ],
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.5 - 45,
                left: MediaQuery.of(context).size.width * 0.5 - 45,
                child: PetViewOwner(),
              ),
              BackArrow(),
              _bottomMenu(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _petInfos() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          PetViewInfo(
            icon: 'assets/icons/gender.svg',
            label: 'Gender',
            value: 'Female',
          ),
          PetViewInfo(
            icon: 'assets/icons/calendar-3.svg',
            label: 'Age',
            value: '1 year',
          ),
          PetViewInfo(
            icon: 'assets/icons/weight-scale.svg',
            label: 'Weight',
            value: '9 kg',
          ),
          PetViewInfo(
            icon: 'assets/icons/size.svg',
            label: 'Size',
            value: 'Small',
          ),
        ],
      ),
    );
  }

  Widget _bottomMenu() {
    return Positioned(
      bottom: 15,
      left: 30,
      right: 15,
      child: Container(
        child: Row(
          children: [
            PetViewFavoriteButton(),
            SizedBox(
              width: 15,
            ),
            PetViewAdoptButton(),
          ],
        ),
      ),
    );
  }
}
