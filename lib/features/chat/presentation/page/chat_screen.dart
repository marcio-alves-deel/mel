import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mel/data.dart';
import 'package:mel/dependencies.dart';
import 'package:mel/features/chat.dart'
    show
        ChatBloc,
        ChatReceiverBubble,
        ChatSenderBubble,
        ChatStarted,
        ChatState,
        ChatSuccess;
import 'package:mel/widgets.dart' show PageTitle;

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<ChatBloc>(
        create: (_) => di<ChatBloc>()
          ..add(
            ChatStarted(),
          ),
        child: buildBody(context),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              PageTitle('Chat'),
            ],
          ),
          Positioned.fill(
            top: 180,
            bottom: 80,
            child: Container(
              child:
                  BlocBuilder<ChatBloc, ChatState>(builder: (context, state) {
                if (state is! ChatSuccess) return Container();
                final List<Message> messages = state.props[0];
                return ListView.builder(
                  itemBuilder: (BuildContext ctxt, int index) {
                    final Message message = messages[index];
                    if (message.isSender)
                      return ChatSenderBubble(message);
                    else
                      return ChatReceiverBubble(message);
                  },
                  itemCount: messages.length,
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
