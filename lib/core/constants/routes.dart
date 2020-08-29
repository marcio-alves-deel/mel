import 'package:mel/features/home/home.dart';
import 'package:mel/features/login.dart' show LoginScreen;
import 'package:mel/features/pet_view.dart' show PetViewScreen;
import 'package:sailor/sailor.dart' show Sailor, SailorParam, SailorRoute;

class Routes {
  static final sailor = Sailor();

  static void createRoutes() {
    sailor.addRoutes([
      SailorRoute(
        name: '/home_screen',
        builder: (context, args, params) {
          return HomeScreen();
        },
      ),
      SailorRoute(
        name: '/login_screen',
        builder: (context, args, params) {
          return LoginScreen();
        },
      ),
      SailorRoute(
        name: '/pet_view',
        builder: (context, args, params) {
          return PetViewScreen();
        },
        params: [
          SailorParam<String>(
            name: 'url',
            defaultValue: 'null',
          ),
          SailorParam<int>(
            name: 'id',
            defaultValue: 0,
          ),
        ],
      ),
      SailorRoute(
        name: '/chat',
        builder: (context, args, params) {
          return PetViewScreen();
        },
      )
    ]);
  }
}
