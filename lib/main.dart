import 'dart:io';

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xylophone Flutter App',
      home: Xylophone(),
    );
  }
}

class Xylophone extends StatefulWidget {
  @override
  _XylophoneState createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
  AudioCache _audio = AudioCache();

  @override
  void initState() {
    super.initState();

    if (Platform.isIOS) {
      if (_audio.fixedPlayer != null) {
        _audio.fixedPlayer.startHeadlessService();
      }
    }

    // Play welcome sound
    _audio.play('sweep.wav');
  }

  void playSound(int noteNumber) {
    _audio.play('note$noteNumber.wav');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            return orientation == Orientation.portrait
                ? _buildPortraitLayout()
                : _buildLandscapeLayout();
          },
        ),
      ),
    );
  }

  Column _buildPortraitLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: _buildKeys(),
    );
  }

  Row _buildLandscapeLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: _buildKeys(),
    );
  }

  _buildKeys() {
    return [
      _buildKey(Colors.red, 'C', 1),
      _buildKey(Colors.orange, 'D', 2),
      _buildKey(Colors.yellow, 'E', 3),
      _buildKey(Colors.green, 'F', 4),
      _buildKey(Colors.teal, 'G', 5),
      _buildKey(Colors.blue, 'A', 6),
      _buildKey(Colors.purple, 'B', 7),
      _buildKey(Colors.pinkAccent, 'C', 8),
    ];
  }

  Expanded _buildKey(Color color, String noteKey, int noteNumber) {
    return Expanded(
      child: FlatButton(
        color: color,
        child: Text(
          noteKey,
          style: TextStyle(color: Colors.white54, fontSize: 40.0),
        ),
        onPressed: () {
          playSound(noteNumber);
        },
      ),
    );
  }
}
