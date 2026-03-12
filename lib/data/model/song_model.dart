import 'package:ostad_14_xylophone_app_media_player/domain/entities/song.dart';

class SongModel extends Song {
  const SongModel({
    required super.title,
    required super.artist,
    required super.url,
    required super.durationSecond,
  });

  static List<Song> getSampleSong() {
    return const [
      SongModel(
        title: "Song One",
        artist: "Artist A",
        url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
        durationSecond: 120,
      ),
      SongModel(
        title: "Song Two",
        artist: "Artist B",
        url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3",
        durationSecond: 150,
      ),
      SongModel(
        title: "Song Three",
        artist: "Artist C",
        url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3",
        durationSecond: 180,
      ),
    ];
  }
}
