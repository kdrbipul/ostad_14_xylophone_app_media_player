import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:ostad_14_xylophone_app_media_player/domain/entities/song.dart';
import '../../../../data/model/song_model.dart';

class MediaProvider extends ChangeNotifier{
  final AudioPlayer _audioPlayer = AudioPlayer();
  final List<Song> _playlist = SongModel.getSampleSong();

  int _currentIndex = 0;
  bool _isPlaying = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;



  AudioPlayer get audioPlayer => _audioPlayer;
  List<Song> get playlist => _playlist;
  Song? get currentSong => _playlist.isNotEmpty ? _playlist[currentIndex] : null;
  int get currentIndex => _currentIndex;
  bool get isPlaying => _isPlaying;
  Duration get duration => _duration;
  Duration get position => _position;

  MediaProvider (){
    _initialAudioPlayer();
  }
  void _initialAudioPlayer() {
    _audioPlayer.onDurationChanged.listen((newDuration){
      _duration = newDuration;
      notifyListeners();
    });
    
    _audioPlayer.onPositionChanged.listen((newPosition){
      _position = newPosition;
      notifyListeners();
    });

    _audioPlayer.onPositionChanged.listen((state){
      _isPlaying = state == PlayerState.playing;
      notifyListeners();
    });

    _audioPlayer.onPlayerComplete.listen((event) {});

    if (_playlist.isNotEmpty){}

  }
  Future<void> playNext(){
    _currentIndex = (_currentIndex+1)%_playlist.length;
  }
  
}