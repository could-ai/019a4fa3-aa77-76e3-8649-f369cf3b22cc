import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import '../providers/audio_provider.dart';
import '../widgets/waveform_widget.dart';
import '../widgets/audio_controls.dart';
import '../widgets/effect_controls.dart';

class EditorScreen extends StatefulWidget {
  const EditorScreen({super.key});

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  String? _currentFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Editor'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              // Save mix logic
            },
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // Share mix logic
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Waveform Display
          Expanded(
            flex: 3,
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFF1DB954).withOpacity(0.3),
                  width: 2,
                ),
              ),
              child: _currentFile != null
                  ? WaveformWidget(filePath: _currentFile!)
                  : const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.music_note,
                            size: 64,
                            color: Colors.white30,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Import a track to start editing',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          ),
          // Audio Controls
          const AudioControls(),
          // Effect Controls
          const Expanded(
            flex: 2,
            child: EffectControls(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Import file logic
        },
        backgroundColor: const Color(0xFF1DB954),
        child: const Icon(Icons.file_upload),
      ),
    );
  }
}