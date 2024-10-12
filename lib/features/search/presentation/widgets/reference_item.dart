import 'package:flutter/material.dart';
import 'package:pop_reference/core/utils/utils.dart';
import 'package:pop_reference/features/search/domain/entities/search_entity.dart';
import 'package:pop_reference/features/search/presentation/widgets/title_reference.dart';

class ReferenceItem extends StatelessWidget {
  const ReferenceItem({super.key, required this.reference});

  final Result reference;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(
              getIcon(reference.source),
              width: 14.sp,
            ).only(right: .2.w),
            Expanded(
              child: TitleReference(reference: reference),
            ),
            CircleAvatar(
              backgroundColor: Palette.black,
              radius: 11.sp,
              child: Icon(
                Icons.bookmark_outline,
                size: 12.sp,
                color: Palette.white,
              ),
            ),
          ],
        ).only(bottom: .5.h),
        Row(
          children: [
            Icon(
              Icons.travel_explore,
              size: 11.sp,
              color: Palette.darkBlack,
            ).only(right: .5.w),
            Texts.regular(
              reference.domain,
              fontSize: 10,
              color: Palette.darkBlack,
            ).only(right: 2.w),
            Icon(
              Icons.person,
              size: 11.sp,
              color: Palette.darkBlack,
            ).only(right: .5.w),
            Texts.regular(
              reference.authors,
              fontSize: 10,
              textOverflow: TextOverflow.ellipsis,
              color: Palette.darkBlack,
            ).only(right: 2.w),
            Icon(
              Icons.calendar_month,
              size: 11.sp,
              color: Palette.darkBlack,
            ).only(right: .5.w),
            Texts.regular(
              reference.year,
              fontSize: 10,
              color: Palette.darkBlack,
            ),
          ],
        ).only(bottom: 1.h),
        Texts.regular(
          reference.description.replaceAll('\n', ' '),
          fontSize: 10,
          textOverflow: TextOverflow.ellipsis,
          maxLines: 5,
          color: Palette.darkBlack,
        ),
      ],
    );
  }

  String getIcon(Source source) {
    switch (source) {
      case Source.GOOGLE_SCHOLAR:
        return "assets/google.png";
      case Source.SCIELO:
        return "assets/scielo.png";
      default:
        return "assets/google.png";
    }
  }

  Color getColor(Source source) {
    switch (source) {
      case Source.GOOGLE_SCHOLAR:
        return Palette.google;
      case Source.SCIELO:
        return Palette.scielo;
      default:
        return Palette.google;
    }
  }
}
