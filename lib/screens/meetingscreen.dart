import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/jitsi_meet_methods.dart';

import '../widgets/button_home.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({Key? key}) : super(key: key);

  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(100000000) + 10000000).toString();

    _jitsiMeetMethods.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ButtonHome(
              onPressed: createNewMeeting,
              text: 'New Meeting',
              icon: Icons.videocam,
            ),
            ButtonHome(
              onPressed: () {},
              text: 'Join Meeting',
              icon: Icons.add_box,
            ),
            ButtonHome(
              onPressed: () {},
              text: 'Schedule',
              icon: Icons.calendar_today,
            ),
            ButtonHome(
                onPressed: () {},
                text: 'Share Screen',
                icon: Icons.arrow_upward_outlined),
          ],
        ),
        const Expanded(
            child: Center(
          child: Text(
            'Create/Join Meetings',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w400,
            ),
          ),
        ))
      ],
    );
  }
}
