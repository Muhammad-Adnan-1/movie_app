import 'package:book_my_seat/book_my_seat.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/app/routes/route_names.dart';
import 'package:movies_app/features/movie/presentation/screens/movie_details_screen.dart';
import 'package:movies_app/features/watch/data/model/upcoming_movies_api_response.dart';
import 'package:movies_app/shared/assets/my_svgs.dart';
import 'package:movies_app/shared/helpers/helper.dart';
import 'package:movies_app/shared/styles/color.dart';
import 'package:movies_app/shared/widgets/custom_appbar.dart';
import 'package:movies_app/shared/widgets/custom_button.dart';

class BookingScreen extends StatelessWidget {
  final MovieModel? movieModel;

  const BookingScreen({super.key, this.movieModel});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: customAppBar(context,
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 18,),
              Text(
                movieModel?.originalTitle ?? "",
                style: theme.textTheme.bodyLarge,
              ),
              Text(
                "In Theaters ${movieModel?.releaseDate?.toFormattedDateString()}",
                style: theme.textTheme.bodySmall
                    ?.copyWith(
                    color: AppColors.blueColor,
                    fontWeight: FontWeight.w500, fontSize: 12),
              )
            ],
          ),
          backgroundColor: theme.colorScheme.surface,
          elevation: 0,
          centerTitle: true,
      ),
      body: Container(
        color: theme.primaryColor.withOpacity(0.1),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.only(top: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal:
                  MediaQuery.of(context).size.width * 0.05),
              child: Text(
                "Date",
                style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.primaryColor,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(
                      horizontal:
                      MediaQuery.of(context).size.width *
                          0.04),
                  itemBuilder: (context, index) {

                    return Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(7),
                          color: index == 0 ? AppColors.blueColor: AppColors.unSelectedTagColor,
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 6),
                        child: Text("${index+1} Mar",
                            style: theme.textTheme.bodyMedium
                                ?.copyWith(
                                color: index == 0 ? theme
                                    .colorScheme.surface: AppColors.titleColor,
                                height: 1.5,
                                fontWeight: FontWeight.w600,
                                fontSize: 12)),
                      ),
                    );
                  }),
            ),
            SizedBox(height: 30,),
            SizedBox(
              height: 200,
              child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(
                      horizontal:
                      MediaQuery.of(context).size.width *
                          0.04),
                  itemBuilder: (context, index) {

                    return Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(width: 9,),
                              Text(
                                "12:30",
                                style: theme.textTheme.bodyLarge?.copyWith(
                                    color: theme.primaryColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(width: 8,),
                              Text(
                                "Cinetech + Hall",
                                style: theme.textTheme.bodySmall?.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(width: 9,),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.67,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(7),
                                border: Border.all(color: index == 0 ? AppColors.blueColor: theme.primaryColor.withOpacity(0.1)),
                              ),
                              margin: const EdgeInsets.symmetric(horizontal: 6),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 6),
                              child: Center(
                                child: SeatLayoutWidget(
                                  onSeatStateChanged: (rowIndex, colIndex, updatedSeatState) {
                                    print("tapped $rowIndex $colIndex $updatedSeatState");
                                  },
                                  stateModel: SeatLayoutStateModel(
                                    rows: 10,
                                    cols: 24,
                                    seatSvgSize: 9,

                                    pathUnSelectedSeat: MySvg.vipSeatSVG,
                                    pathSelectedSeat: MySvg.selectedSeatSVG,
                                    pathSoldSeat: MySvg.regularSeatSVG,
                                    pathDisabledSeat: MySvg.soldSeatSVG,
                                    currentSeatsState: [
                                      <SeatState>[
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.sold,
                                        SeatState.disabled,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.disabled,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.unselected,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.unselected,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.selected,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.selected,
                                        SeatState.empty,

                                      ],
                                      <SeatState>[
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.sold,
                                        SeatState.empty,
                                        SeatState.sold,
                                        SeatState.disabled,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.disabled,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.unselected,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.unselected,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.selected,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.selected,
                                        SeatState.empty,

                                      ],
                                      <SeatState>[
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.sold,
                                        SeatState.empty,
                                        SeatState.sold,
                                        SeatState.disabled,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.disabled,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.unselected,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.unselected,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.selected,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.selected,
                                        SeatState.empty,

                                      ],
                                      <SeatState>[
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.sold,
                                        SeatState.empty,
                                        SeatState.sold,
                                        SeatState.disabled,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.disabled,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.unselected,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.unselected,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.selected,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.selected,
                                        SeatState.empty,

                                      ],
                                      <SeatState>[
                                        SeatState.empty,
                                        SeatState.selected,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.sold,
                                        SeatState.empty,
                                        SeatState.sold,
                                        SeatState.disabled,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.disabled,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.unselected,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.unselected,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.selected,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.selected,
                                        SeatState.empty,

                                      ],
                                      <SeatState>[
                                        SeatState.empty,
                                        SeatState.selected,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.sold,
                                        SeatState.empty,
                                        SeatState.sold,
                                        SeatState.disabled,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.disabled,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.unselected,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.unselected,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.selected,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.selected,
                                        SeatState.empty,

                                      ],
                                      <SeatState>[
                                        SeatState.empty,
                                        SeatState.selected,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.sold,
                                        SeatState.empty,
                                        SeatState.sold,
                                        SeatState.disabled,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.disabled,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.unselected,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.unselected,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.selected,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.selected,
                                        SeatState.empty,

                                      ],
                                      <SeatState>[
                                        SeatState.empty,
                                        SeatState.selected,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.sold,
                                        SeatState.empty,
                                        SeatState.sold,
                                        SeatState.disabled,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.disabled,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.unselected,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.unselected,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.selected,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.selected,
                                        SeatState.empty,

                                      ],
                                      <SeatState>[
                                        SeatState.empty,
                                        SeatState.selected,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.sold,
                                        SeatState.empty,
                                        SeatState.sold,
                                        SeatState.disabled,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.disabled,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.unselected,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.unselected,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.selected,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.selected,
                                        SeatState.empty,

                                      ],
                                      <SeatState>[
                                        SeatState.empty,
                                        SeatState.selected,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.sold,
                                        SeatState.empty,
                                        SeatState.sold,
                                        SeatState.disabled,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.disabled,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.unselected,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.unselected,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.selected,
                                        SeatState.empty,
                                        SeatState.empty,
                                        SeatState.selected,
                                        SeatState.empty,

                                      ],
                                    ],

                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 9.0, vertical: 10),
                            child: RichText(text: TextSpan(
                              children: [
                                TextSpan(text: "From", style: theme.textTheme.bodyLarge?.copyWith(
                                    color: theme.primaryColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500)),
                                TextSpan(text: " 50\$ ", style: theme.textTheme.bodyLarge?.copyWith(
                                    color: theme.primaryColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700)),
                                TextSpan(text: "or", style: theme.textTheme.bodyLarge?.copyWith(
                                    color: theme.primaryColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500)),
                                TextSpan(text: " 2500 bonus", style: theme.textTheme.bodyLarge?.copyWith(
                                    color: theme.primaryColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700)),
                              ]
                            )),
                          )
                        ],
                      ),
                    );
                  }),
            ),
            Spacer(),
            Spacer(),

            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.06),
              child: CustomButton(
                buttonText: "Select Seats",
                backgroundColor: AppColors.blueColor,
                fontSize: 14,
                onPress: (){
                  context.pushNamed(RouteNames.seatSelection, extra: movieModel);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
