import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movies_app/app/routes/route_names.dart';
import 'package:movies_app/features/watch/data/model/upcoming_movies_api_response.dart';
import 'package:movies_app/features/search/application/provider/search_provider.dart';
import 'package:movies_app/shared/assets/my_images.dart';
import 'package:movies_app/shared/assets/my_svgs.dart';
import 'package:movies_app/shared/helpers/app_firebase_callback.dart';
import 'package:movies_app/shared/helpers/common_views.dart';
import 'package:movies_app/shared/widgets/base_widget.dart';
import 'package:movies_app/shared/widgets/custom_text_field.dart';
import 'package:movies_app/shared/widgets/loading_widget.dart';
import 'package:movies_app/shared/widgets/network_image_with_placeholder.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> implements AppResultCallback{
  @override
  Widget build(BuildContext context) {
    var searchProvider = SearchProvider(Provider.of(context));
    searchProvider.listenPagination();
    searchProvider.getMovieGenreList(this);
    var theme = Theme.of(context);

    return BaseWidget<SearchProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            backgroundColor: theme.colorScheme.surface,
            body: SafeArea(
              top: true,
              child: Column(
                children: [
                  Container(
                    color: theme.scaffoldBackgroundColor,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomTextField(
                      hintText: "Tv shows, movies and more",
                      controller: provider.searchController,
                      onFieldSubmitted: (t) {
                        provider.setSearch(t);
                      },

                    ),
                  ),
                  Expanded(
                    child: provider.isSearch
                        ? Container(
                            color: theme.primaryColor.withOpacity(0.1),
                            margin: const EdgeInsets.only(top: 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  child: Text(
                                    "Top Results",
                                    style: theme.textTheme.bodyMedium,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15, top: 10),
                                  child: Divider(
                                    height: 0.5,
                                    thickness: 0.5,
                                    color: theme.dividerColor,
                                  ),
                                ),
                                Expanded(
                                  child: PagedListView<int, MovieModel>(
                                    pagingController: provider.pagingController,
                                    padding: const EdgeInsets.only(
                                        top: 20,
                                        bottom: 60,
                                        left: 15,
                                        right: 15),
                                    physics: const ClampingScrollPhysics(),
                                    builderDelegate: PagedChildBuilderDelegate(
                                        itemBuilder: (context, item, index) {

                                      return SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 100,
                                        child: MaterialButton(
                                          onPressed: () {
                                            if(item.id != null) {
                                              context.pushNamed(
                                                RouteNames.movieDetails, extra: item.id!);
                                            }else{
                                              CommonViews.showErrorToast("Movie not found!");
                                            }
                                          },
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 7),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 120,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: NetworkImageWithPlaceHolder(imageUrl: item.posterPath),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 21.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        item.originalTitle ?? "",
                                                        style: theme.textTheme
                                                            .bodyMedium,
                                                      ),
                                                      Text(
                                                        item.genres?.first.name ?? "",
                                                        style: theme.textTheme
                                                            .bodySmall,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SvgPicture.asset(
                                                MySvg.horizontalDotsSVG,
                                                width: 4,
                                                height: 4,
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            color: theme.primaryColor.withOpacity(0.1),
                            margin: const EdgeInsets.only(top: 25),
                            child: provider.loading ? LoadingWidget(): GridView.builder(
                                itemCount: provider.movieGenreApiResponse?.genres?.length ?? 0,
                                padding: const EdgeInsets.only(
                                    top: 20, bottom: 60, left: 15, right: 15),
                                physics: const ClampingScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 1.6),
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Stack(
                                        alignment: Alignment.bottomLeft,
                                        children: [
                                          Image.asset(
                                            MyImages.placeHolder,
                                            fit: BoxFit.cover,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: double.infinity,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                color: theme
                                                    .colorScheme.secondary
                                                    .withOpacity(0.3)),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0, vertical: 20),
                                            child: Text(
                                              provider.movieGenreApiResponse?.genres?[index].name ?? "",
                                              style: theme.textTheme.bodyLarge
                                                  ?.copyWith(
                                                      color: theme
                                                          .scaffoldBackgroundColor,
                                                      fontWeight:
                                                          FontWeight.w500),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                  ),
                ],
              ),
            ),
            // bottomNavigationBar: ,
          );
        },
        provider: searchProvider);
  }

  @override
  void onError(String message) {
    CommonViews.showErrorToast(message);
  }

  @override
  void onSuccess({String? type, parameters}) {

  }
}
