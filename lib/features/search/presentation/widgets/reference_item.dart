import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:pop_reference/core/utils/utils.dart';
import 'package:pop_reference/features/search/domain/entities/search_entity.dart';
import 'package:pop_reference/features/search/presentation/widgets/title_reference.dart';

class ReferenceItem extends StatelessWidget {
  const ReferenceItem({super.key, required this.reference});

  final Result reference;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
      decoration: BoxDecoration(
        color: Palette.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 4.w,
            padding: EdgeInsets.all(1.w),
            height: 4.w,
            margin: EdgeInsets.only(right: 1.w),
            decoration: BoxDecoration(
              color: getColor(reference.source),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.asset(
              getIcon(reference.source),
              width: 14.sp,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TitleReference(reference: reference),
                    ),
                    Icon(
                      IconlyBold.bookmark,
                      size: 12.sp,
                      color: Palette.greyScale2,
                    ),
                  ],
                ).only(bottom: .5.h),
                Texts.regular(
                  "${reference.domain}, ${reference.authors}",
                  fontSize: 10,
                  textOverflow: TextOverflow.ellipsis,
                  color: Palette.greyScale2,
                ).only(bottom: 1.h),
                Texts.regular(
                  reference.year,
                  fontSize: 10,
                  color: Palette.greyScale2,
                ).only(bottom: 2.h),
                Texts.regular(
                  reference.description.replaceAll('\n', ' '),
                  fontSize: 10,
                  textOverflow: TextOverflow.ellipsis,
                  maxLines: 5,
                  color: Palette.darkBlack,
                ),
              ],
            ),
          ),
        ],
      ),
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
