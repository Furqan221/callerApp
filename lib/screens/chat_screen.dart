import 'package:callerapp/screens/video_call_screen.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

final TextEditingController messageController = TextEditingController();

List messages = [
  "Hi, how are you?",
  "Hi, how are you?",
  "Hi, how are you?",
  "Hi, how are you?",
  "Hi, how are you?",
  "Hi, how are you?",
];

List isMe = [
  false,
  true,
  false,
  true,
  false,
  true,
];

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(17, 0, 0, 0),
      appBar: AppBar(
        title: Text("Chat Screen"),
        centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => VideoCallScreen()));
                },
                icon: Icon(
                  Icons.video_call,
                  color: Colors.black,
                )),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        color: Color.fromARGB(76, 255, 193, 7),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 350,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(5),
                child: TextFormField(
                  controller: messageController,
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (messageController.text.isNotEmpty) {
                    messages.add(messageController.text.toString());
                    isMe.add(true);

                    messageController.clear();
                    setState(() {});
                  }
                },
                child: Icon(
                  Icons.send,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: messages.length,
          itemBuilder: (context, index) {
            return Align(
              alignment:
                  !isMe[index] ? Alignment.centerLeft : Alignment.centerRight,
              child: Container(
                decoration: BoxDecoration(
                    color: !isMe[index]
                        ? Colors.amber
                        : Color.fromARGB(108, 0, 0, 0),
                    borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(5),
                child: Text(messages[index].toString()),
              ),
            );
          }),
    );
  }
}
