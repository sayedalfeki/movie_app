import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});
  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage>
{
  var audioPlayer=AudioPlayer();
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    audioPlayer.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context)
  {
    return SafeArea(
      child: Scaffold(
        body: Column(
      
          children: [
            Text('06:00'),
            ElevatedButton(onPressed: ()async
            {
             await Future.delayed(Duration(minutes: 2));
              audioPlayer.setAsset('assets/audios/fatihah.mp3');
              audioPlayer.play();
            }, child: Text('set'))
          ],
        ),
      ),
    );
  }
}
