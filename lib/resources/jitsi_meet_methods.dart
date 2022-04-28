import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom_clone/resources/auth_method.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';

class JitsiMeetMethods {
  final AuthMothods _authMothods = AuthMothods();
  void createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
  }) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution
          .MD_RESOLUTION; // Limit video resolution to 360p

      var options = JitsiMeetingOptions(
        room: roomName,
      )

        // ..serverURL = "https://someHost.com"
        // ..subject = "Meeting with Gunschu"
        ..userDisplayName = _authMothods.user.displayName
        ..userEmail = _authMothods.user.email
        ..userAvatarURL = _authMothods.user.photoURL
        // ..audioOnly = true
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted;
      // ..featureFlag = featureFlag;

      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      print("error: $error");
    }
  }
}
