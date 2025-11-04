import 'package:flutter/material.dart';
import 'package:flutter_audio_waveforms/flutter_audio_waveforms.dart';
import 'package:provider/provider.dart';
import '../providers/audio_provider.dart';

class WaveformWidget extends StatefulWidget {
  final String filePath;

  const WaveformWidget({super.key, required this.filePath});

  @override
  State<WaveformWidget> createState() => _WaveformWidgetState();
}

class _WaveformWidgetState extends State<WaveformWidget> {
  List<double> _waveformData = [];

  @override
  void initState() {
    super.initState();
    _generateWaveformData();
  }

  void _generateWaveformData() {
    // Generate mock waveform data (in real app, this would be extracted from audio file)
    _waveformData = List.generate(100, (index) {
      return (index % 10 == 0) ? 1.0 : (index % 5 == 0) ? 0.7 : 0.3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AudioProvider>(
      builder: (context, audioProvider, child) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: PolygonWaveform(
            samples: _waveformData,
            height: 200,
            width: MediaQuery.of(context).size.width - 64,
            maxDuration: audioProvider.duration,
            elapsedDuration: audioProvider.position,
            showActiveWaveform: true,
            activeColor: const Color(0xFF1DB954),
            inactiveColor: Colors.white24,
            strokeWidth: 2,
          ),
        );
      },
    );
  }
}