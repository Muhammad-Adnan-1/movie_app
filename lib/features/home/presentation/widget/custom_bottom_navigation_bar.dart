import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/features/home/application/provider/home_provider.dart';
import 'package:movies_app/shared/widgets/base_widget.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final HomeProvider homeProvider;

  const CustomBottomNavigationBar({super.key, required this.homeProvider});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return BaseWidget<HomeProvider>(
        builder: (context, provider, child) {

          return Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(27),
                topRight: Radius.circular(27),
              ),
              color: theme.primaryColor,
            ),
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 13),
            child: Row(
              children: provider.homeDataList.map((element){
                return Expanded(
                  child: MaterialButton(
                    onPressed: (){
                      provider.updateSelectedIndex(element.index);
                      context.go(element.route);
                    },
                    padding: const EdgeInsets.only(top: 17, bottom: 17,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(element.icon, width: 18, height: 18, color: element.index == provider.selectedIndex ? theme.colorScheme.surface: theme.disabledColor, colorBlendMode: BlendMode.srcIn,),
                        const SizedBox(height: 4,),
                        Text(element.title, style: theme.textTheme.bodySmall?.copyWith(
                          color: element.index == provider.selectedIndex ? theme.colorScheme.surface: theme.disabledColor,
                          fontWeight: element.index == provider.selectedIndex ? FontWeight.bold: FontWeight.normal,
                        ),)
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        },
        provider: homeProvider);
  }





}
