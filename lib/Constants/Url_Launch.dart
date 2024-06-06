import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLaunchWidget extends StatefulWidget {
  final String url;

  UrlLaunchWidget({required this.url});

  @override
  _UrlLaunchWidgetState createState() => _UrlLaunchWidgetState();
}

class _UrlLaunchWidgetState extends State<UrlLaunchWidget> {
  @override
  void initState() {
    super.initState();
    _launchURL(widget.url);
    Navigator.pop(context);
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.pop(context); // Navigate back to the previous page
      },
      child: Text(
        "CLICK TO BACK",
        //style: bigOrangeColor,
      ),
    );
  }
}
