import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom_clone/resources/auth_method.dart';
import 'package:zoom_clone/resources/jitsi_meet_methods.dart';
import 'package:zoom_clone/utils/colors.dart';

import '../widgets/options.dart';

class VideoCall extends StatefulWidget {
  const VideoCall({Key? key}) : super(key: key);

  @override
  State<VideoCall> createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  final AuthMothods _authMothods = AuthMothods();
  late TextEditingController meetingIdController;
  late TextEditingController nameController;
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();

  bool isAudioMuted = true;
  bool isVideoMuted = true;
  @override
  void initState() {
    // TODO: implement initState
    meetingIdController = TextEditingController();
    nameController = TextEditingController(
      text: _authMothods.user.displayName,
    ); // Show the name of user from google sign in.
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    meetingIdController.dispose();
    nameController.dispose();
    JitsiMeet.removeAllListeners();
  }

  _joinMeeting() {
    _jitsiMeetMethods.createMeeting(
      roomName: meetingIdController.text,
      isAudioMuted: isAudioMuted,
      isVideoMuted: isVideoMuted,
      username: nameController.text,
    );
    // if (meetingIdController.text.isEmpty) {
    //   return AlertDialog(
    //     content: const Text("This is my message."),
    //     actions: [
    //       TextButton(onPressed: () {}, child: const Text("OK")),
    //     ],
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Join a Meeting',
          style: TextStyle(
            fontSize: 21.0,
          ),
        ),
        elevation: 0,
        backgroundColor: backgroundColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: 60,
                child: TextField(
                  controller: meetingIdController,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    fillColor: secondaryBackgroundColor,
                    filled: true,
                    border: InputBorder.none,
                    hintText: 'Room ID',
                    hintStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                    contentPadding: EdgeInsets.fromLTRB(16, 2, 0, 0),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                child: TextField(
                  controller: nameController,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    fillColor: secondaryBackgroundColor,
                    filled: true,
                    border: InputBorder.none,
                    hintText: 'Name',
                    hintStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                    contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                color: Colors.green,
                width: double.infinity,
                child: InkWell(
                  onTap: _joinMeeting,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 8, top: 10, bottom: 15),
                    child: Padding(
                      padding: EdgeInsets.only(left: 170.0),
                      child: Text(
                        'Join',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                  splashColor: Colors.green,
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              MeetingOption(
                text: "Mute Audio",
                isMute: isAudioMuted,
                onChange: onAudioMuted,
              ),
              const SizedBox(
                height: 10,
              ),
              MeetingOption(
                text: "Turn off video",
                isMute: isVideoMuted,
                onChange: onVideoMuted,
              ),
            ],
          ),
        ),
      ),
    );
  }

  onAudioMuted(bool val) {
    setState(() {
      isAudioMuted = val;
    });
  }

  onVideoMuted(bool val) {
    setState(() {
      isVideoMuted = val;
    });
  }
}
