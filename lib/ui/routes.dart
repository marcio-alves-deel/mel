import 'package:mel/layouts.dart' show HomeLayout;
import 'package:sailor/sailor.dart' show Sailor, SailorRoute;

class Routes {
  static final sailor = Sailor();

  static void createRoutes() {
    sailor.addRoutes([
      SailorRoute(
        name: '/',
        builder: (context, args, params) {
          return HomeLayout();
        },
      )
    ]);
  }
}
