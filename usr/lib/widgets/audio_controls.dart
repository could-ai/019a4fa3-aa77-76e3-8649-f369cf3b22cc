import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/audio_provider.dart';

class AudioControls extends StatelessWidget {
  const AudioControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AudioProvider>(
      builder: (context, audioProvider, child) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              // Progress bar
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: const Color(0xFF1DB954),
                  inactiveTrackColor: Colors.white24,
                  thumbColor: const Color(0xFF1DB954),
                  overlayColor: const Color(0xFF1DB954).withOpacity(0.3),
                ),
                child: Slider(
                  value: audioProvider.position.inSeconds.toDouble(),
                  max: audioProvider.duration.inSeconds.toDouble(),
                  onChanged: (value) {
                    audioProvider.seek(Duration(seconds: value.toInt()));
                  },
                ),
              ),
              // Time display
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _formatDuration(audioProvider.position),
                    style: const TextStyle(color: Colors.white70),
                  ),
                  Text(
                    _formatDuration(audioProvider.duration),
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Control buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.skip_previous, color: Colors.white),
                    iconSize: 32,
                    onPressed: () {
                      // Previous track logic
                    },
                  ),
                  const SizedBox(width: 32),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF1DB954),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(
                        audioProvider.isPlaying ? Icons.pause : Icons.play_arrow,
                        color: Colors.white,
                      ),
                      iconSize: 32,
                      onPressed: () {
                        if (audioProvider.isPlaying) {
                          audioProvider.pause();
                        } else {
                          audioProvider.play();
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 32),
                  IconButton(
                    icon: const Icon(Icons.skip_next, color: Colors.white),
                    iconSize: 32,
                    onPressed: () {
                      // Next track logic
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }
}