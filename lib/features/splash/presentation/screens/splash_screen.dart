
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/app/routes/route_names.dart';
import 'package:movies_app/shared/widgets/logo_widget.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5)).then((value) async {
      navigateNextPage();
    });
    super.initState();
  }

  navigateNextPage(){
    if(mounted) {
      context.go(RouteNames.dashboard);
    }
  }



  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LogoWidget(
              size: MediaQuery.of(context).size.width/4,
              logoColor: theme.colorScheme.surface,
            ),
          ],
        ),
      ),
    );
  }
}
