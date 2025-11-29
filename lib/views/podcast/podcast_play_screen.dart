import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:jolly_podcast_test/models/podcast/podcasts_model.dart';
import 'package:jolly_podcast_test/models/podcast/trending_podcast_model.dart';
import 'package:jolly_podcast_test/views/podcast/components/note_player.dart';

class PodcastPlayerScreen extends StatefulWidget {
  final TrendingPodcastModel_Data_Data2_Data3 podcast;
  const PodcastPlayerScreen({Key? key, required this.podcast}) : super(key: key);

  @override
  State<PodcastPlayerScreen> createState() => _PodcastPlayerScreenState();
}

class _PodcastPlayerScreenState extends State<PodcastPlayerScreen> {

  late AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    // TODO: implement initState
    // Create the audio player.
    player = AudioPlayer();
    // Set the release mode to keep the source after playback has completed.
    player.setReleaseMode(ReleaseMode.stop);
    super.initState();
  }
  @override
  void dispose() {
    // Release all sources and dispose the player.
    player.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF00A85A), // light green
            Color(0xFF007B43), // darker green
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(100.0)
                  ),
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white.withOpacity(0.9),
                    size: 35,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                  padding: EdgeInsets.only(left: 20, right: 20,),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(28),
                      child: Image.network(
                         widget.podcast.pictureUrl,
                        width: double.infinity,
                        height: 260,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 30),
                     Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.podcast.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.podcast.description,
                      maxLines: 5,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        height: 1.4,

                      ),
                    ),

                    const SizedBox(height: 25),
                  ],
                )
              ),

              PlayerWidget(
                player: player,
                path: widget.podcast.contentUrl ?? "",
                onTapNext: (){},
                onTapReverse: (){},
              ),
              const SizedBox(height: 40),
              Wrap(
                spacing: 14,
                runSpacing: 14,
                alignment: WrapAlignment.center,
                children: [
                  _actionButton(Icons.playlist_add, "Add to queue"),
                  _actionButton(Icons.favorite_border, "Save"),
                  _actionButton(Icons.share, "Share episode"),
                  _actionButton(Icons.add, "Add to playlist"),
                  _actionButton(Icons.arrow_forward,
                      "Go to episode page", isOutline: true),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _actionButton(IconData icon, String label,
      {bool isOutline = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white, width: 2),
        color: isOutline ? Colors.transparent : Colors.white24,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 20),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
