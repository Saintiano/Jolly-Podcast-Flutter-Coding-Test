import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jolly_podcast_test/components/custom_app_bar_v3.dart';
import 'package:jolly_podcast_test/components/custom_text_field.dart';
import 'package:jolly_podcast_test/components/dialogs.dart';
import 'package:jolly_podcast_test/constants/images.dart';
import 'package:jolly_podcast_test/constants/svgs.dart';
import 'package:jolly_podcast_test/controllers/auth/auth_controller.dart';
import 'package:jolly_podcast_test/models/podcast/podcasts_model.dart';
import 'package:jolly_podcast_test/models/podcast/trending_podcast_model.dart';
import 'package:jolly_podcast_test/repositories/auth/auth_repository.dart';
import 'package:jolly_podcast_test/services/loading_overlay_service.dart';
import 'package:jolly_podcast_test/views/podcast/components/podcast_card.dart';
import 'package:jolly_podcast_test/views/podcast/podcast_play_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  AuthController controller = Get.put(AuthController(AuthHttpsRepository()));
  @override
  void initState() {
    getAllPodcasts();
    getAllTrending();
    super.initState();
  }

  List<PodcastsModel_Data_Data_Data> podcasts = [];
  List<TrendingPodcastModel_Data_Data2_Data3> trending = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    OverlayService.hideOverlay(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: const EdgeInsets.only(left: 0, right: 0),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.secondary,
                  //add more colors for gradient
                ],
                begin: Alignment.topRight, //begin of the gradient color
                end: Alignment.bottomRight, //end of the gradient color
                stops: const [0, 0.2, 0.5, 0.8] //stops for individual color
              //set the stops number equal to numbers of color
            ),
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0)
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60,
            ),
            const Custom_App_Bar_Nav_V3(
              title: 'Transfers',
              // colorBg: AppColors.white,
              imageIsTitle: true,
              noImage: false,
              buttonIsLeading: false,
              noNavbutton: false,
              titleIsBold: true,
              fontSize: 16,
              leftMargin: 10,
              rightMargin: 10,
              isDashboard: true,
              isNotDashboardTabs: false,
              titleIsAtTheBeginning: true,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Gap(40),
                  Row(
                    children: [
                      Image.asset(
                        podcast_fire,
                        height: 36,
                      ),
                      Gap(10),
                      Padding(
                        padding: EdgeInsets.only(left: 0, right: 0, top: 5),
                        child: Custom_Text_Field(
                          fontSize: 24,
                          title: "Hot & trending episodes",
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  Gap(20),
                  SizedBox(
                    height: 350,
                    child: trending.isEmpty ?
                    Center(
                      child: Text("No podcasts found",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ):
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      controller: ScrollController(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        // physics: const NeverScrollableScrollPhysics(),
                        itemCount: trending.length,
                        itemBuilder: (context, index){

                          TrendingPodcastModel_Data_Data2_Data3 podcast = trending[index];

                          return PodcastCard(
                            coverImage: podcast.pictureUrl,
                            thumbnailImage: podcast.podcast.publisher.profileImageUrl,
                            title: podcast.title,
                            description: podcast.description,
                            onTap: (){
                              print("ontap");
                              callTokenBottomSheet(size: size, podcast: podcast);
                            },
                            onTapFav: (){
                              print("onTapFav");
                            },
                            onTapPlayList: (){
                              print("onTapPlayList");
                            },
                            onTapAdd: (){
                              print("onTapAdd");
                            },
                            onTapShare: (){
                              print("onTapShare");
                            },
                          );
                        }),
                  )
                ],
              ),
            )

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => controller.loginController(phoneNumber: "phoneNumber", password: "password", loading: (loading){}),
      ),
    );
  }

  void getAllPodcasts(){
    controller.getAllPodcastsController(
        page: 1,
        per_page: 4,
        loading: (isLoading){
          if (isLoading) {
            OverlayService.showOverlay(context);
          } else {
            OverlayService.hideOverlay(context);
          }
        }
    ).then((onValue){

      if(onValue.data != null){

        print("onValue: ${onValue.data!.data2.data3}");
        setState(() {
          podcasts = onValue.data!.data2.data3;
        });

        print("podcasts ${podcasts}");

      }else{
        Timer(const Duration(seconds: 1), () {
          //Show errors with empty arguments
          DialogWidgets.showAlertWarning(
              isOneButton: true,
              title: "Podcasts",
              content: "${onValue.message}",
              context: context,
              // imageUrlString: cancel_bad,
              imageUrlString: circled_x,
              actionTexRight: "Continue",
              rightButton: (){
                Navigator.pop(context);
              }
          );
        });
      }

    });
  }
  void getAllTrending(){
    controller.trendingPodcastController(
        page: 1,
        per_page: 4,
        loading: (isLoading){
          if (isLoading) {
            OverlayService.showOverlay(context);
          } else {
            OverlayService.hideOverlay(context);
          }
        }
    ).then((onValue){

      if(onValue.data != null){

        print("onValue: ${onValue.data!.data2.data3}");
        setState(() {
          trending = onValue.data!.data2.data3;
        });

        print("trending ${podcasts}");

      }else{
        Timer(const Duration(seconds: 1), () {
          //Show errors with empty arguments
          DialogWidgets.showAlertWarning(
              isOneButton: true,
              title: "Podcasts",
              content: "${onValue.message}",
              context: context,
              // imageUrlString: cancel_bad,
              imageUrlString: circled_x,
              actionTexRight: "Continue",
              rightButton: (){
                Navigator.pop(context);
              }
          );
        });
      }

    });
  }

  void callTokenBottomSheet({
    required Size size,
    required TrendingPodcastModel_Data_Data2_Data3 podcast,
  }) {
    DialogWidgets.customBodyDialog(
        context,
        noDismissIcon: true,
        transparency: MaterialType.transparency,
        child: PodcastPlayerScreen(
          key: UniqueKey(),
          podcast: podcast,
        )
    );
  }

}
