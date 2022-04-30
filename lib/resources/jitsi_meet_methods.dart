import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom_clone/resources/auth_method.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:zoom_clone/resources/firestoremethods.dart';

class JitsiMeetMethods {
  final AuthMothods _authMothods = AuthMothods();
  final FirestoreMethods _firestoreMethods = FirestoreMethods();
  createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String username = "",
  }) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution
          .MD_RESOLUTION; // Limit video resolution to 360p

      String name;
      if (username.isEmpty) {
        name = _authMothods.user.displayName!;
      } else {
        name = username;
      }

      // if (roomName.isEmpty) {
      //   // throw Exception("Please enter a meeting ID");

      // }

      var options = JitsiMeetingOptions(room: roomName)

        // ..serverURL = "https://someHost.com"
        // ..subject = "Meeting with Gunschu"
        ..userDisplayName = name
        ..userEmail = _authMothods.user.email
        ..userAvatarURL = _authMothods.user.photoURL
        // ..audioOnly = true
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted;
      // ..featureFlag = featureFlag;

      _firestoreMethods.addToMeetingHistory(roomName);
      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      print("error: $error");
    }
  }
}
