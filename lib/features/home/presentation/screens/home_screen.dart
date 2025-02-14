import 'package:flutter/material.dart';
import 'package:movies_app/features/home/application/provider/home_provider.dart';
import 'package:movies_app/features/home/presentation/widget/custom_bottom_navigation_bar.dart';
import 'package:movies_app/shared/widgets/base_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final Widget child;
  const HomeScreen({super.key, required this.child});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var homeProvider = HomeProvider(Provider.of(context));
    homeProvider.getHomeData();

    return BaseWidget<HomeProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            body: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                widget.child,
                child!
              ],
            ),
           // bottomNavigationBar: ,
          );
        },
        provider: homeProvider,
        child: CustomBottomNavigationBar(
          homeProvider: homeProvider,
        ));
  }
}


