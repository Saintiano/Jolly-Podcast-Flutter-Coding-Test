import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jolly_podcast_test/styles/app_colors.dart';

class PodcastCard extends StatelessWidget {
  const PodcastCard({super.key,
    required this.coverImage,
    required this.thumbnailImage,
    required this.title,
    required this.description,
    this.onTap,
    this.onTapFav,
    this.onTapPlayList,
    this.onTapShare,
    this.onTapAdd
  });

  final String? coverImage;
  final String? thumbnailImage;
  final String title;
  final String description;

  final Function()? onTap;
  final Function()? onTapFav;
  final Function()? onTapPlayList;
  final Function()? onTapShare;
  final Function()? onTapAdd;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        clipBehavior: Clip.hardEdge,
      // height: 350,
      width: size.width * 0.75,
      margin: const EdgeInsets.only(left: 0, right: 20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF0A233E), // dark blue
            Color(0xFF0E3A24), // deep green
          ],
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.all(0),
      child: Column(
        children: [
          Container(
              width: size.width,
              height: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(coverImage ?? "https://clovisokonkwo.com/img/about-img_clovis_2.png"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.3), // Adjust opacity here (0.0 to 1.0)
                      BlendMode.dstATop,
                    ),
                  ),
                  gradient: LinearGradient(
                      colors: [
                        AppColors.primary,
                        AppColors.primary,
                        AppColors.primary,
                        AppColors.primary,
                      ],
                      begin: Alignment.topRight, //begin of the gradient color
                      end: Alignment.bottomRight, //end of the gradient color
                      stops: const [0, 0.2, 0.5, 0.8] //stops for individual color
                    //set the stops number equal to numbers of color
                  ),
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(24),
                      topLeft: Radius.circular(24)
                  )
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 10,
                    bottom:  10,
                    child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(thumbnailImage ?? coverImage ?? "https://clovisokonkwo.com/img/about-img_clovis_2.png"),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.5), // Adjust opacity here (0.0 to 1.0)
                                BlendMode.dstATop,
                              ),
                            ),

                            gradient: LinearGradient(
                                colors: [
                                  AppColors.primary,
                                  AppColors.primary,
                                  AppColors.primary,
                                  AppColors.primary,
                                ],
                                begin: Alignment.topRight, //begin of the gradient color
                                end: Alignment.bottomRight, //end of the gradient color
                                stops: const [0, 0.2, 0.5, 0.8] //stops for individual color
                              //set the stops number equal to numbers of color
                            ),
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(8),
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8)
                            )
                        ),
                        child: Center(
                          child: _circleBtn(icon: Icons.play_circle_fill, size: 50, onTap: onTap),
                        )
                    ),
                  ),

                ]
              )
          ),
          Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                     Text(
                      title,
                      style:const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                     Text(
                      description,
                      style:const TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                        height: 1.4,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _circleBtn(icon: Icons.favorite_border, onTap: onTapFav),
                        Gap(10),
                        _circleBtn(icon: Icons.playlist_add, onTap: onTapPlayList),
                        Gap(10),
                        _circleBtn(icon: Icons.share, onTap: onTapShare),
                        Gap(10),
                        _circleBtn(icon: Icons.add, onTap: onTapAdd),
                      ],
                    ),
                  ],
                ),
              ),
          )
        ],
      )
    );
  }

  Widget _circleBtn({required IconData icon, double? size, Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: const BoxDecoration(
          color: Colors.white12,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: size ?? 22),
      )
    );
  }
}
