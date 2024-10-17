import 'package:flutter/material.dart';
import 'package:pop_reference/core/utils/utils.dart';
import 'package:pop_reference/features/search/domain/entities/search_entity.dart';
import 'package:url_launcher/url_launcher.dart';

class TitleReference extends StatefulWidget {
  const TitleReference({super.key, required this.reference});

  final Result reference;

  @override
  State<TitleReference> createState() => _TitleReferenceState();
}

class _TitleReferenceState extends State<TitleReference> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHover = false;
        });
      },
      child: GestureDetector(
        onTap: () async {
          final uri = Uri.parse(widget.reference.link);
          await launchUrl(uri);
        },
        child: Texts.bold(
          widget.reference.title,
          fontSize: 11,
          maxLines: 2,
          underline: isHover,
          textOverflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
