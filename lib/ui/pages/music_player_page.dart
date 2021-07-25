import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musicapps/core/api_services/music_service.dart';
import 'package:musicapps/core/models/music_model.dart';

class MusicPlayerPage extends StatefulWidget {
  const MusicPlayerPage({Key? key}) : super(key: key);

  @override
  _MusicPlayerPageState createState() => _MusicPlayerPageState();
}

class _MusicPlayerPageState extends State<MusicPlayerPage>
    with SingleTickerProviderStateMixin {
  final audioPlayer = AssetsAudioPlayer();
  List<Audio> audioList = [];
  int selectedAudio = 0;
  @override
  void initState() {
    getMusics();
    audioPlayer.open(
      Playlist(
        audios: audioList,
      ),
      autoStart: false,
      showNotification: true,
      loopMode: LoopMode.playlist,
    );
    super.initState();
  }

  void getMusics() async {
    var result = await MusicService().getAllMusic();
    if (result != null) {
      List<MusicModel> musicList = result;

      for (final model in musicList) {
        var audio = Audio.network(model.musicFileUrl!,
            metas: Metas(
                id: model.sId,
                title: model.musicName,
                artist: model.musicAuthors,
                album: model.musicAlbum,
                image: MetasImage.network(model.musicImageUrl!)));

        audioList.add(audio);
      }
    }
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  var playPauseIcon = Icons.play_circle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Container _buildBody() {
    return Container(
      child: Column(
        children: [
          Expanded(
              flex: 18,
              child: Container(
                  //  color: Colors.blueAccent,
                  )),
          Expanded(
              flex: 40,
              child: Container(
                //    color: Colors.grey,
                child: Center(
                  child: ListTile(
                    trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                        )),
                    leading: CircleAvatar(),
                    title: Text(
                      "Listeninge  with Kate",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )),
          Expanded(
              flex: 250,
              child: Container(
                  //   color: Colors.orange,

                  )),
          Expanded(
              flex: 20,
              child: Container(
                //   color: Colors.blueAccent,
                child: Center(
                  child: Text(
                    audioList[selectedAudio].metas.title!,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
              )),
          Expanded(
              flex: 10,
              child: Container(
                //   color: Colors.red,
                child: Text(
                  audioList[selectedAudio].metas.artist!,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              )),
          Expanded(
              flex: 65,
              child: Container(
                  //     color: Colors.yellow,
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                  InkWell(
                      onTap: () {
                        //  audioPlayer.previous();
                        if (selectedAudio > 0) {
                          selectedAudio--;
                          audioPlayer.playlistPlayAtIndex(selectedAudio);
                          setState(() {});
                        }
                      },
                      child: Icon(Icons.skip_previous,
                          size: 40, color: Colors.white)),
                  InkWell(
                      onTap: () {
                        setState(() {
                          audioPlayer.playOrPause();

                          if (playPauseIcon == Icons.play_circle) {
                            playPauseIcon = Icons.pause_circle;
                          } else {
                            playPauseIcon = Icons.play_circle;
                          }
                        });
                      },
                      child:
                          Icon(playPauseIcon, size: 80, color: Colors.white)),
                  InkWell(
                      onTap: () {
                        if (selectedAudio < audioList.length) {
                          selectedAudio++;
                          audioPlayer.playlistPlayAtIndex(selectedAudio);
                          setState(() {});
                        }

                        //audioPlayer.next();
                      },
                      child:
                          Icon(Icons.skip_next, size: 40, color: Colors.white)),
                  Icon(Icons.control_point, color: Colors.white),
                ],
              ))),
        ],
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(audioList[selectedAudio].metas.image!.path),
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.9), BlendMode.dstATop))),
    );
  }
}
