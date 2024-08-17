import 'package:flutter/material.dart';
import 'package:goclip/models/clip.dart';
import 'package:flutter/services.dart';

class SingleClip extends StatefulWidget {
  final ClipModel model;
  final int ClipexternalId;
  final Function(int) clipDelete;
  const SingleClip({super.key, required this.model, required this.clipDelete, required this.ClipexternalId});
  @override
  State<SingleClip> createState() => _SingleClipState();
}

class _SingleClipState extends State<SingleClip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        color: Color.fromARGB(38, 0, 0, 0),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => {setclipdata(context)},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Text(
                      widget.model.clipText,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // IconButton(
          //   onPressed: () {  },
          //   iconSize: 25,
          //   icon: const Icon(Icons.screen_lock_rotation_sharp) 
          // ),
          // IconButton(
          //   onPressed: () { widget.clipDelete(widget.ClipexternalId); },
          //   iconSize: 25,
          //   icon: const Icon(Icons.delete) 
          // )
        ],
      ),
    );
  }

  void setclipdata(BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: widget.model.clipText));
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      const SnackBar(
        content: Text('Text Copied'),
      ),
    );
  }
}
