import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class PlayerWidget extends StatefulWidget {
  final AudioPlayer player;
  final Function onTapReverse;
  final Function onTapNext;
  final String path;

  const PlayerWidget({
    required this.player,
    required this.onTapReverse,
    required this.onTapNext,
    super.key,
    required this.path,
  });

  @override
  State<StatefulWidget> createState() {
    return _PlayerWidgetState();
  }
}

class _PlayerWidgetState extends State<PlayerWidget> {
  PlayerState? _playerState;
  Duration? _duration;
  Duration? _position;

  StreamSubscription? _durationSubscription;
  StreamSubscription? _positionSubscription;
  StreamSubscription? _playerCompleteSubscription;
  StreamSubscription? _playerStateChangeSubscription;

  bool get _isPlaying => _playerState == PlayerState.playing;

  bool get _isPaused => _playerState == PlayerState.paused;

  String get _durationText => _duration?.toString().split('.').first ?? '';

  String get _positionText => _position?.toString().split('.').first ?? '';

  AudioPlayer get player => widget.player;



  @override
  void initState() {
    super.initState();
    // Use initial values from player
    _playerState = player.state;
    player.getDuration().then(
          (value) => setState(() {
        _duration = value;
      }),
    );
    player.getCurrentPosition().then(
          (value) => setState(() {
        _position = value;
      }),
    );
    _initStreams();
  }

  @override
  void setState(VoidCallback fn) {
    // Subscriptions only can be closed asynchronously,
    // therefore events can occur after widget has been disposed.
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    _durationSubscription?.cancel();
    _positionSubscription?.cancel();
    _playerCompleteSubscription?.cancel();
    _playerStateChangeSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: (_position != null &&
                _duration != null &&
                _position!.inMilliseconds > 0 &&
                _position!.inMilliseconds < _duration!.inMilliseconds)
                ? _position!.inMilliseconds / _duration!.inMilliseconds
                : 0.0,
            minHeight: 6,
            backgroundColor: Colors.white24,
            valueColor: const AlwaysStoppedAnimation<Color>(
              Colors.white,
            ),
          ),
        ),
        // Slider(
        //   onChanged: (value) {
        //     final duration = _duration;
        //     if (duration == null) {
        //       return;
        //     }
        //     final position = value * duration.inMilliseconds;
        //     player.seek(Duration(milliseconds: position.round()));
        //   },
        //   value: (_position != null &&
        //       _duration != null &&
        //       _position!.inMilliseconds > 0 &&
        //       _position!.inMilliseconds < _duration!.inMilliseconds)
        //       ? _position!.inMilliseconds / _duration!.inMilliseconds
        //       : 0.0,
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_position != null
                ? _positionText
                : _duration != null
                ? _durationText
                : '',
                style: TextStyle(color: Colors.white70)),
            Text(_position != null
                ? _durationText
                : _duration != null
                ? _durationText
                : '',
                style: TextStyle(color: Colors.white70)),
          ],
        ),
        // Text(
        //   _position != null
        //       ? '$_positionText / $_durationText'
        //       : _duration != null
        //       ? _durationText
        //       : '',
        //   style: TextStyle(fontSize: 16.0, color: color),
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: (){
                widget.onTapReverse();
              },
              child: Icon(Icons.fast_rewind,
                  color: Colors.white, size: 40),
            ),

            GestureDetector(
              onTap: (){
                player.seek(Duration(seconds: _position!.inSeconds - 10));
              },
              child: _circleIcon(Icons.replay_10),
            ),

            _circlePlayButton(),

            GestureDetector(
              onTap: (){
                player.seek(Duration(seconds: _position!.inSeconds + 10));
              },
              child: _circleIcon(Icons.forward_10),
            ),

            GestureDetector(
              onTap: (){
                widget.onTapNext();
              },
              child: Icon(Icons.fast_forward,
                  color: Colors.white, size: 40),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // IconButton(
            //   key: const Key('play_button'),
            //   onPressed: () async {
            //     // await player.play(DeviceFileSource(widget.path));
            //     // await player.setSource(AssetSource(widget.path));
            //     await player.resume();
            //     _isPlaying ? null : _play;
            //   },
            //   iconSize: 48.0,
            //   icon: const Icon(Icons.play_arrow),
            //   color: color,
            // ),
            // IconButton(
            //   key: const Key('pause_button'),
            //   onPressed: _isPlaying ? _pause : null,
            //   iconSize: 48.0,
            //   icon: const Icon(Icons.pause),
            //   color: color,
            // ),
            IconButton(
              key: const Key('stop_button'),
              onPressed: _isPlaying || _isPaused ? _stop : null,
              iconSize: 48.0,
              icon: const Icon(Icons.stop),
              color: color,
            ),
          ],
        ),
      ],
    );
  }

  void _initStreams() {
    _durationSubscription = player.onDurationChanged.listen((duration) {
      setState(() => _duration = duration);
    });

    _positionSubscription = player.onPositionChanged.listen(
          (p) => setState(() => _position = p),
    );

    _playerCompleteSubscription = player.onPlayerComplete.listen((event) {
      setState(() {
        _playerState = PlayerState.stopped;
        _position = Duration.zero;
      });
    });

    _playerStateChangeSubscription =
        player.onPlayerStateChanged.listen((state) {
          setState(() {
            _playerState = state;
          });
        });
  }

  Future<void> _play() async {
    await player.resume();
    setState(() => _playerState = PlayerState.playing);
  }

  Future<void> _pause() async {
    await player.pause();
    setState(() => _playerState = PlayerState.paused);
  }

  Future<void> _stop() async {
    await player.stop();
    setState(() {
      _playerState = PlayerState.stopped;
      _position = Duration.zero;
    });
  }

  /// Small circular icon used for replay 10 / forward 10
  Widget _circleIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Icon(icon, color: Colors.white, size: 26),
    );
  }

  /// Main Play/Pause button
  Widget _circlePlayButton() {
    return GestureDetector(
      onTap: () async{
        // await player.play(DeviceFileSource(files[index].path));
        if(_isPlaying){

          await player.pause();

        }else{

          await player.play(UrlSource(widget.path));

        }

      },
      child: Container(
        padding: const EdgeInsets.all(26),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(_isPlaying ? Icons.pause : Icons.play_circle_fill, color: Colors.green, size: 34),
      ),
    );
  }

}