import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// import 'package:googleapis/youtube/v3.dart';

class YoutubeScreen extends StatefulWidget {
  const YoutubeScreen({Key? key}) : super(key: key);

  @override
  State<YoutubeScreen> createState() => _YoutubeScreenState();
}

class _YoutubeScreenState extends State<YoutubeScreen> {
  /* final _googleSignIn = GoogleSignIn(
    scopes: <String>[YouTubeApi.youtubeReadonlyScope],
  ); */
  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: '2C2tUWP2YyA',
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: true,
    ),
  );

  void _testingWithFloating() {
    _controller.toggleFullScreenMode();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // debugPrint('is this it? $_googleSignIn');
    return Scaffold(
      body: SafeArea(
        child: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: false,
          ),
          builder: (context, player) {
            return player;
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: _testingWithFloating,
            icon: const Icon(Icons.fullscreen),
          ),
          const SizedBox(width: 32.0),
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }
}
