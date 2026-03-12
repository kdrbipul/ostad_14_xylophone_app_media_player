import 'package:ostad_14_xylophone_app_media_player/domain/entities/song.dart';

class SongModel extends Song{
 const SongModel({
    required super.title,
    required super.artist,
    required super.url,
    required super.durationSecond
  });

  static List<Song> getSampleSong(){
    return const [
      SongModel(title: title, artist: artist, url: url, durationSecond: durationSecond),
    ];
  }

}