import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goclip/models/clip.dart';
import 'package:goclip/widgets/clipCards.dart';

class BoardScreen extends StatefulWidget {
  final String title;
  final List<ClipModel> clipList = [];
  BoardScreen({super.key, required this.title});

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
   final clipboardContentStream = StreamController<String>.broadcast();
   Timer? clipboardTriggerTime;

   Stream<String> get clipboardText => clipboardContentStream.stream;

   @override
  void initState() {
    super.initState();
    _startClipboardListener();
    
  }

  void _startClipboardListener() {
    clipboardTriggerTime = Timer.periodic(const Duration(seconds: 5), (timer) {
      Clipboard.getData('text/plain').then((clipboardContent) {
        if (clipboardContent != null) {
          setState(() {
            var newclip = ClipModel(clipText: clipboardContent.text!, isPinned: false ,creationDate :DateTime.now());
            String lastClip = widget.clipList.isEmpty?'':widget.clipList.last.clipText;
            if(lastClip != clipboardContent.text!){
              widget.clipList.add(newclip);
            }
          });
        }
      });
    });
  }

  @override
  void dispose() {
    clipboardContentStream.close();
    clipboardTriggerTime?.cancel();
    super.dispose();
  }
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 20),
        ),
      ),
      body: ClipCards(
        clipsList: widget.clipList,
      ),
    );
  }
}
