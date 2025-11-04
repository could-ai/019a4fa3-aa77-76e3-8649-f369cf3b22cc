import 'package:flutter/material.dart';

class PlaylistProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _playlists = [
    {
      'name': 'My Mixes',
      'tracks': [],
      'coverColor': Colors.green,
    },
    {
      'name': 'Chill Vibes',
      'tracks': [],
      'coverColor': Colors.blue,
    },
    {
      'name': 'Workout Beats',
      'tracks': [],
      'coverColor': Colors.orange,
    },
  ];

  List<Map<String, dynamic>> get playlists => _playlists;

  void addPlaylist(String name, Color coverColor) {
    _playlists.add({
      'name': name,
      'tracks': [],
      'coverColor': coverColor,
    });
    notifyListeners();
  }

  void addTrackToPlaylist(int playlistIndex, Map<String, dynamic> track) {
    _playlists[playlistIndex]['tracks'].add(track);
    notifyListeners();
  }

  void removeTrackFromPlaylist(int playlistIndex, int trackIndex) {
    _playlists[playlistIndex]['tracks'].removeAt(trackIndex);
    notifyListeners();
  }
}