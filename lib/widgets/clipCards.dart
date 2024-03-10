import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:goclip/models/clip.dart';
import 'package:goclip/widgets/singleClip.dart';

class ClipCards extends StatefulWidget {
  final List<ClipModel> clipsList;
  const ClipCards({super.key, required this.clipsList});

  @override
  State<ClipCards> createState() => _ClipCardsState();
}

class _ClipCardsState extends State<ClipCards> {
  @override
  Widget build(BuildContext context) {
    return widget.clipsList.isNotEmpty
        ? ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: generateClips(widget.clipsList),
          )
        : const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Nothing here", style: TextStyle(fontSize: 18),), 
                Text("You'll See your clipboard history here once\n you're copy something", textAlign: TextAlign.center,)
              ]),
          );
  }

  List<SingleClip> generateClips(List<ClipModel> clipsList) {
    List<SingleClip> result = [];
    for (final c in clipsList) {
      result.add(SingleClip(
        c,
        model: c,
      ));
    }
    return result;
  }
}
