import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:club_cast/data_layer/bloc/intial_cubit/general_app_cubit.dart';
import 'package:club_cast/data_layer/bloc/intial_cubit/general_app_cubit_states.dart';
import 'package:club_cast/presentation_layer/components/constant/constant.dart';
import 'package:club_cast/presentation_layer/models/getMyFollowingPodcast.dart';
import 'package:club_cast/presentation_layer/models/get_all_podcst.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivePodCastScreen extends StatelessWidget {
  int? index;
  double duration;
  String userPhoto;
  String userName;
  String podCastId;
  String podcastUrl;
  String podcastName;
  ActivePodCastScreen(
      {this.index,
      required this.duration,
      required this.podCastId,
      required this.podcastName,
      required this.podcastUrl,
      required this.userName,
      required this.userPhoto});

  @override
  Widget build(BuildContext context) {
    var cubit = GeneralAppCubit?.get(context);
    double time = duration;
    String convertedTime =
        '${((time % (24 * 3600)) / 3600).round().toString()}:${((time % (24 * 3600 * 3600)) / 60).round().toString()}:${(time % 60).round().toString()}';
    return BlocConsumer<GeneralAppCubit, GeneralAppStates>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            title: Text(
              podcastName,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage(userPhoto),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    userName,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  Slider(
                    activeColor: Theme.of(context).primaryColor,
                    inactiveColor: Theme.of(context).backgroundColor,
                    value: podCastId == cubit.activePodCastId
                        ? cubit.currentPostionDurationInsec
                        : 0,
                    onChanged: (newval) {
                      cubit.pressedPause && podCastId == cubit.activePodCastId
                          ? const SizedBox()
                          : podCastId == cubit.activePodCastId
                              ? cubit.assetsAudioPlayer.seek(
                                  Duration(
                                    seconds: newval.toInt(),
                                  ),
                                )
                              : const SizedBox();
                    },
                    min: 0,
                    max: duration.toDouble(),
                  ),
                  Text(
                    cubit.isPlaying && podCastId == cubit.activePodCastId
                        ? cubit.currentOlayingDurathion!
                        : cubit.pressedPause &&
                                podCastId == cubit.activePodCastId
                            ? cubit.currentOlayingDurathion!
                            : convertedTime,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Card(
                      elevation: 8,
                      color: Theme.of(context).backgroundColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 12.0,
                          right: 12,
                          top: 40,
                        ),
                        child: Column(
                          children: [
                            Text(
                              userName,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MaterialButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  onPressed: () {
                                    cubit.isPlaying &&
                                            podCastId == cubit.activePodCastId
                                        ? cubit.assetsAudioPlayer.seekBy(
                                            const Duration(seconds: -10))
                                        : const SizedBox();
                                  },
                                  child: Icon(
                                    Icons.replay_10,
                                    color: Theme.of(context).iconTheme.color,
                                    size: Theme.of(context).iconTheme.size,
                                  ),
                                ),
                                Card(
                                  color: Theme.of(context).primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: MaterialButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    onPressed: () {
                                      String podCastUrl = podcastUrl;
                                      cubit.isPlaying &&
                                              podCastId == cubit.activePodCastId
                                          ? cubit.assetsAudioPlayer
                                              .pause()
                                              .then((value) {
                                              cubit.isPlaying = false;
                                              cubit.pressedPause = true;
                                              cubit.activePodCastId = podCastId;
                                              cubit.changeState();
                                            })
                                          : cubit.playingPodcast(
                                              podCastUrl,
                                              podcastName,
                                              userPhoto,
                                              podCastId,
                                              context);
                                    },
                                    child: Icon(
                                      cubit.isPlaying &&
                                              podCastId == cubit.activePodCastId
                                          ? Icons.pause
                                          : Icons.play_arrow,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                MaterialButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  onPressed: () {
                                    cubit.isPlaying &&
                                            podCastId == cubit.activePodCastId
                                        ? cubit.assetsAudioPlayer
                                            .seekBy(const Duration(seconds: 10))
                                        : const SizedBox();
                                  },
                                  child: Icon(
                                    Icons.forward_10,
                                    color: Theme.of(context).iconTheme.color,
                                    size: Theme.of(context).iconTheme.size,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
