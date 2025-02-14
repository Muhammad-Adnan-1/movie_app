import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movies_app/app/routes/route_names.dart';
import 'package:movies_app/features/watch/application/provider/watch_provider.dart';
import 'package:movies_app/features/watch/data/model/upcoming_movies_api_response.dart';
import 'package:movies_app/shared/helpers/common_views.dart';
import 'package:movies_app/shared/widgets/base_widget.dart';
import 'package:movies_app/shared/widgets/custom_appbar.dart';
import 'package:movies_app/shared/widgets/network_image_with_placeholder.dart';
import 'package:provider/provider.dart';

class WatchScreen extends StatefulWidget {
  const WatchScreen({super.key});

  @override
  State<WatchScreen> createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen> {
  @override
  Widget build(BuildContext context) {
    var homeProvider = WatchProvider(Provider.of(context));

    homeProvider.listenPagination();

    var theme = Theme.of(context);

    return BaseWidget<WatchProvider>(
        builder: (context, provider, child) {
          return Scaffold(
              appBar: customAppBar(context,
                  text: "Watch",
                  elevation: 0,
                  backgroundColor: theme.scaffoldBackgroundColor,
                  actions: [
                    IconButton(
                        onPressed: () {
                          context.pushNamed(RouteNames.search);
                        },
                        icon: const Icon(Icons.search_rounded))
                  ]),
              backgroundColor: theme.primaryColor.withOpacity(0.1),
              body: PagedListView<int, MovieModel>(
                  pagingController: provider.pagingController,
                  padding: const EdgeInsets.only(top: 20, bottom: 60),
                  builderDelegate: PagedChildBuilderDelegate(
                      itemBuilder: (context, item, index) {
                    return Container(
                      height: 180,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: MaterialButton(
                        onPressed: () {
                          if(item.id != null) {
                            context.pushNamed(RouteNames.movieDetails, extra: item.id!);
                          }else{
                            CommonViews.showErrorToast("Movie not found");
                          }
                        },
                        padding:
                            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              NetworkImageWithPlaceHolder(
                                imageUrl: item.posterPath,
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                  colors: [
                                    Colors.transparent,
                                    Colors.transparent,
                                    theme.colorScheme.secondary
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                )),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 16),
                                child: Text(
                                  item.originalTitle ?? "",
                                  style: theme.textTheme.titleMedium?.copyWith(
                                      color: theme.scaffoldBackgroundColor,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }))
              // bottomNavigationBar: ,
              );
        },
        provider: homeProvider);
  }
}
