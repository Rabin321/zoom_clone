import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zoom_clone/resources/firestoremethods.dart';

class HistoryMeetingScreen extends StatelessWidget {
  const HistoryMeetingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirestoreMethods().meetingHistory,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
            itemCount: (snapshot.data! as dynamic).docs.length,
            itemBuilder: (context, index) => ListTile(
                  title: Text(
                    'Room Name: ${(snapshot.data! as dynamic).docs[index]['meetingName']}',
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    'Joined on: ${DateFormat.yMMMd().format((snapshot.data! as dynamic).docs[index]['createdAt'].toDate())}',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ));
      },
    );
  }
}
