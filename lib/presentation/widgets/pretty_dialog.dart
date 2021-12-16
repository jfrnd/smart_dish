import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PrettyDialog extends StatelessWidget {
  const PrettyDialog({
    Key? key,
    this.width = 300,
    required this.title,
    this.subtitle,
    required this.body,
    this.actions = const [],
  }) : super(key: key);

  final String title;
  final double? width;
  final String? subtitle;
  final List<Widget> body;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Dialog(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              width: width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                          TitleBar(
                            title: title,
                            subtitle: subtitle,
                          )
                        ] +
                        [const Divider()] +
                        body +
                        [
                          actions.isNotEmpty
                              ? const Divider()
                              : const SizedBox()
                        ] +
                        actions,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TitleBar extends StatelessWidget {
  final String title;
  final String? subtitle;

  const TitleBar({
    Key? key,
    required this.title,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(title,
                  style: Theme.of(context).textTheme.headline6),
              subtitle != null
                  ? SelectableText(subtitle!,
                      style: Theme.of(context).textTheme.caption)
                  : const SizedBox(),
            ],
          ),
        ),
        IconButton(
          onPressed: () => Navigator.pop(context),
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: const Icon(
            Icons.cancel,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
