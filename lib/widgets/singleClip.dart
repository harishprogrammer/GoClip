import 'package:flutter/material.dart';
import 'package:goclip/models/clip.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SingleClip extends StatefulWidget {
  final ClipModel model;
  const SingleClip(ClipModel c, {super.key, required this.model});

  @override
  State<SingleClip> createState() => _SingleClipState();
}

class _SingleClipState extends State<SingleClip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(5),
      height: 60,
      decoration: const BoxDecoration(
        color: Color.fromARGB(38, 0, 0, 0),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      child: GestureDetector(
        onTap: ()=>{setclipdata(context)},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 300,
              child: Text(
                widget.model.clipText,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            // Checkbox(
            //   value: widget.model.isPinned,
            //   onChanged: (bool? value) {},
            // )
          ],
        ),
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
