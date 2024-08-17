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
    return Column(
      children: [
        widget.clipsList.isNotEmpty
            ? Expanded(
                child: ListView.builder(
                  itemCount: widget.clipsList.length,
                  itemBuilder: (context, index) {
                    final clip = widget.clipsList[index];
                    return SingleClip(
                      model: clip,
                      ClipexternalId: index,
                      clipDelete: (index) {
                        widget.clipsList.removeAt(index);
                        setState(() {
                          widget.clipsList;
                        });
                      },                      
                    );
                  },
                ),
              )
            : const Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Nothing here",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "You'll See your clipboard history here once\n you're copy something",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
      ],
    );
  }
}
