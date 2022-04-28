import 'package:flutter/material.dart';
import 'package:zoom_clone/screens/meetingscreen.dart';
import 'package:zoom_clone/utils/colors.dart';

import '../widgets/button_home.dart';
import 'history_meeting_screen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _page = 0;
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    MeetingScreen(),
    const HistoryMeetingScreen(),
    const Text('Contacts'),
    const Text('Settings'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Meet & Chat'),
        centerTitle: true,
        backgroundColor: backgroundColor,
      ),

      body: pages[_page],

      //Bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: footerColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          onTap: onPageChanged,
          currentIndex: _page,
          // type: BottomNavigationBarType.fixed,
          // type: BottomNavigationBarType.shifting, =>> Default

          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.comment_bank),
              label: 'Meet & Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.lock_clock),
              label: 'Meetings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Contacts',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: 'Settings',
            ),
          ]),
    );
  }
}



// After extract 

// class HistoryMeeting extends StatelessWidget {
//   const HistoryMeeting({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             ButtonHome(
//               onPressed: () {},
//               text: 'New Meeting',
//               icon: Icons.videocam,
//             ),
//             ButtonHome(
//               onPressed: () {},
//               text: 'Join Meeting',
//               icon: Icons.add_box,
//             ),
//             ButtonHome(
//               onPressed: () {},
//               text: 'Schedule',
//               icon: Icons.calendar_today,
//             ),
//             ButtonHome(
//                 onPressed: () {},
//                 text: 'Share Screen',
//                 icon: Icons.arrow_upward_outlined),
//           ],
//         ),
//         const Expanded(
//             child: Center(
//           child: Text(
//             'Create/Join Meetings',
//             style: TextStyle(
//               fontSize: 19,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//         ))
//       ],
//     );
//   }
// }
