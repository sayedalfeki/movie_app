import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/config/app_routes.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/core/app_custom_widget/loading_widget.dart';
import 'package:movie_app/core/app_styles.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController videoPlayerController;
  int time=0;
  double sliderValue=0;
  bool isPlayed=false;
  bool isVisible=false;
  @override
  void initState() {
    // TODO: implement initState
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    videoPlayerController =
    // VideoPlayerController.networkUrl(
    //     Uri.parse(
    //       'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    //     ),
    //   )
    VideoPlayerController.asset('assets/videos/qr_code.mkv')
      ..initialize().then((value) {
        setState(() {});
      });
    videoPlayerController.addListener(() {
      time=videoPlayerController.value.position.inSeconds;
      setState(() {

      });
    },);
    videoPlayerController.play();
    isPlayed=true;
    super.initState();
  }

double x=1;
  double y=0;
  @override
  void dispose() {
    // TODO: implement dispose
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    videoPlayerController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
   // move();
    return SafeArea(
      child: Scaffold(
        body:

        videoPlayerController.value.isInitialized
            ? Stack(
//alignment: AlignmentDirectional.bottomStart,
              children: [
                GestureDetector(
                  onTap: () {
                    isVisible=true;
                    setState(() {

                    });
                    Future.delayed(Duration(seconds: 5)).then((value) {
                      isVisible=false;
                      setState(() {

                      });
                    },);
                  },
                  child: Container(
                    height:double.infinity,
                    //color: AppColor.appRedColor,
                    width:double.infinity,
                    child: AspectRatio(
                      aspectRatio: videoPlayerController.value.aspectRatio,
                      child: Container(
                          //color: AppColor.appRedColor,
                          child: VideoPlayer(videoPlayerController)),
                    ),
                  ),
                ),
                //SizedBox(height: 20.h,),
                Visibility(
                  visible:true,
                  child:Transform.translate(
                    offset: Offset(
                    0
                    , MediaQuery.sizeOf(context).height-160
                    ),
                    child: Container(
                      height:300.h,
                      width:900.w,
                      color:Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                           // width: 900.w,
                            color: AppColor.appLightBlackColor,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    if(isPlayed)
                                    {
                                      videoPlayerController.pause();

                                    }
                                    else {
                                      videoPlayerController.play();
                                    }
                                    isPlayed=!isPlayed;
                                    setState(() {});
                                  },
                                  icon: Icon(!isPlayed?Icons.play_circle_rounded:Icons.pause,
                                  color: Colors.white,
                                  ),
                                ),
                                Text(getHoursFromSeconds(time),style: AppStyles.whiteNormal15,),
                              Expanded(
                                child: SizedBox(
                                 // width:300,
                                  child: Slider(
                                    value:time.toDouble(),
                                    min: 0,
                                    max:videoPlayerController.value.duration.inSeconds.toDouble(),
                                    activeColor: Colors.red,
                                    onChanged: (double value)async {
                                      //time++;
                                      //print(videoPlayerController.value.position.inSeconds);
                                      sliderValue=value;
                                      await videoPlayerController.seekTo(
                                        Duration(seconds:(value).toInt())
                                      );
                                      time=videoPlayerController.value.position.inSeconds;
                                      setState(() {

                                      });
                                    },
                                  ),
                                ),
                              ),
                              Text(getHoursFromSeconds(videoPlayerController.value.duration.inSeconds-time),style: AppStyles.whiteNormal15,)
                            ],),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context,AppRoutes.alarmPageRoute);
                            },
                            child: Text('play music',
                            style: AppStyles.whiteNormal15,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
            : Container(),
      ),
    );
  }
  Future<void> move()
  async {
    x+=10;
    y+=10;
    Future.delayed(Duration(seconds: 3)).then((value) {
      setState(() {

      });
    },);
    // setState(() {
    //
    // });
  }
  String getHoursFromSeconds(int seconds)
  {
    int minute=seconds~/60;
    int hours=minute~/60;
    int remainingSeconds=seconds-(minute*60);
    return hours>=1? '$hours:$minute:$remainingSeconds':
        minute>=1? '$minute:$remainingSeconds':'00:$remainingSeconds';
  }
}
