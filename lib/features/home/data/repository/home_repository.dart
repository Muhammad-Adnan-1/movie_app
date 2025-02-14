import 'package:movies_app/app/routes/route_names.dart';
import 'package:movies_app/features/home/data/model/home_data.dart';
import 'package:movies_app/shared/assets/my_svgs.dart';

class HomeRepository {
  HomeRepository();

  List<HomeData> getHomeScreens() {
    return [
      HomeData(0, "Dashboard", MySvg.dashboardSVG, RouteNames.dashboard),
      HomeData(1, "Watch", MySvg.watchSVG, RouteNames.watch),
      HomeData(2, "Media Library", MySvg.mediaLibrarySVG, RouteNames.media),
      HomeData(3, "More", MySvg.moreSVG, RouteNames.more),
    ];
  }
}
