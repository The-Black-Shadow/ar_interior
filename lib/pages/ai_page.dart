import 'dart:convert';
import 'dart:math';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AiPage extends StatefulWidget {
  const AiPage({super.key});

  @override
  State<AiPage> createState() => _AiPageState();
}

class _AiPageState extends State<AiPage> {
  final apiUrl =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=AIzaSyBikC27qxyOqhEausfbnTnQrqzXrY8793s';
  final header = {'Content-Type': 'application/json'};
  ChatUser currentUser = ChatUser(
    id: '1',
    firstName: 'Admin',
  );
  ChatUser bot = ChatUser(
    id: '2',
    firstName: 'DesignBot',
  );
  List<ChatMessage> messages = [];
  List<ChatUser> typing = [];

  Map<String, List<String>> predefinedQuestions = {
    "What's your name?": ["My name is ChatMate."],
    "Who is your developer?": ["I was developed by Mehedi Hasan."],
    "What's your favorite color?": ["I don't have any favorite color."],
    "What's your favorite food?": ["I don't eat food."],
    "What's your favorite movie?": [
      "My favourite movie is IRON-Man 3.",
      "I like Avengers: Endgame."
    ],
  };

  @override
  void initState() {
    super.initState();
    ChatMessage initialMessage = ChatMessage(
      text: "Hello, how can I assist you?",
      user: bot,
      createdAt: DateTime.now(),
    );
    messages.add(initialMessage);
  }

  getData(ChatMessage m) async {
    typing.add(bot);
    messages.insert(0, m);
    setState(() {});

    if (predefinedQuestions.containsKey(m.text)) {
      List<String> responses = predefinedQuestions[m.text]!;
      String response = responses.elementAt(Random().nextInt(responses.length));
      ChatMessage m1 = ChatMessage(
        text: response,
        user: bot,
        createdAt: DateTime.now(),
      );
      messages.insert(0, m1);
      setState(() {});
    } else {
      var data = {
        "contents": [
          {
            "parts": [
              {"text": m.text}
            ]
          }
        ],
      };
      try {
        final response = await http.post(Uri.parse(apiUrl),
            headers: header, body: jsonEncode(data));
        if (response.statusCode == 200) {
          var result = jsonDecode(response.body);
          String apiResponse =
              result['candidates'][0]['content']['parts'][0]['text'];
          predefinedQuestions[m.text] = [apiResponse];
          ChatMessage m1 = ChatMessage(
              text: apiResponse, user: bot, createdAt: DateTime.now());
          messages.insert(0, m1);
          setState(() {});
        } else {
          print('Error: ${response.statusCode}');
        }
      } catch (e) {
        print('Error: $e');
      }
    }
    typing.remove(bot);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'DesignBot',
          style: TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.italic,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      body: DashChat(
        typingUsers: typing,
        currentUser: currentUser,
        onSend: (ChatMessage m) {
          getData(m);
        },
        messages: messages,
      ),
    );
  }
}
