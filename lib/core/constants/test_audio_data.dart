import 'package:assets_audio_player/assets_audio_player.dart';

final TEST_AUDIO_DATA = <Audio>[
  //Audio.network(
  //  'https://d14nt81hc5bide.cloudfront.net/U7ZRzzHfk8pvmW28sziKKPzK',
  //  metas: Metas(
  //    id: 'Invalid',
  //    title: 'Invalid',
  //    artist: 'Florent Champigny',
  //    album: 'OnlineAlbum',
  //    image: MetasImage.network(
  //        'https://image.shutterstock.com/image-vector/pop-music-text-art-colorful-600w-515538502.jpg'),
  //  ),
  //),
  Audio.network(
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Music_for_Video/springtide/Sounds_strange_weird_but_unmistakably_romantic_Vol1/springtide_-_03_-_We_Are_Heading_to_the_East.mp3',
    metas: Metas(
      id: 'Online',
      title: 'Online',
      artist: 'Florent Champigny',
      album: 'OnlineAlbum',
      // image: MetasImage.network('https://www.google.com')
      image: MetasImage.network(
          'https://img.etimg.com/thumb/msid-71477539,width-650,imgsize-622277,,resizemode-4,quality-100/music_thinkstockphotos.jpg'),
    ),
  ),

  Audio.network(
    'https://firebasestorage.googleapis.com/v0/b/musicplayer-7876f.appspot.com/o/music%2Farkaplanmusic.mp3?alt=media&token=cab95ea9-2bdf-4f38-9206-973866222ba1',
    metas: Metas(
      id: 'second song',
      title: 'my first title',
      artist: 'Florent Champigny',
      album: 'OnlineAlbum',
      image: MetasImage.network(
          'https://firebasestorage.googleapis.com/v0/b/musicplayer-7876f.appspot.com/o/images%2F123456?alt=media&token=3c315f5a-7a67-430d-a859-13c5325d81f7'),
    ),
  ),
  /* Audio(
    'assets/audios/2 country.mp3',
    metas: Metas(
      id: 'Country',
      title: 'Country',
      artist: 'Florent Champigny',
      album: 'CountryAlbum',
      image: MetasImage.asset('assets/images/country.jpg'),
    ),
  ),
*/
];
