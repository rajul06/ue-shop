import 'package:flutter/material.dart';
import 'inbox_detail.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inbox Jual', style: TextStyle (color :Colors.black)),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(16.0),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(
                  'https://randomuser.me/api/portraits/men/${index + 1}.jpg'),
            ),
            title: Text('Customer ${index + 1}'),
            subtitle: Text('Hi, apa kabar?'),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('08:30'),
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 12.0,
                  child: Text(
                    '2',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatDetailPage(),
                ),
              );
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 16.0,
            thickness: 1.0,
          );
        },
        itemCount: 10,
      ),
    );
  }
}
