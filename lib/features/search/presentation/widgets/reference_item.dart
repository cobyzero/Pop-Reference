import 'package:flutter/material.dart';
import 'package:pop_reference/core/utils/utils.dart';
import 'package:pop_reference/features/search/domain/entities/search_entity.dart';
import 'package:url_launcher/url_launcher.dart';

class ReferenceItem extends StatelessWidget {
  const ReferenceItem({super.key, required this.reference});

  final Result reference;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Palette.white,
        borderRadius: BorderRadius.circular(15.sp),
        border: Border.all(
          color: Palette.grey,
        ),
      ),
      padding: EdgeInsets.all(.8.w),
      child: Column(
        children: [
          Expanded(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: Palette.google.withOpacity(.15),
                borderRadius: BorderRadius.circular(14.sp),
              ),
              padding: EdgeInsets.all(.4.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        getIcon(reference.domain),
                        width: 17.sp,
                      ),
                      CircleAvatar(
                        backgroundColor: Palette.white,
                        radius: 10.sp,
                        child: Icon(
                          Icons.bookmark_outline,
                          size: 11.sp,
                        ),
                      ),
                    ],
                  ).only(bottom: 2.h),
                  Texts.bold(
                    reference.title,
                    fontSize: 11,
                    maxLines: 2,
                    textOverflow: TextOverflow.ellipsis,
                  ).only(bottom: 1.h),
                  Row(
                    children: [
                      Icon(
                        Icons.person,
                        size: 12.sp,
                      ).only(right: .5.w),
                      Expanded(
                        child: Texts.regular(
                          reference.authors,
                          fontSize: 9,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.travel_explore,
                        size: 12.sp,
                      ).only(right: .5.w),
                      Expanded(
                        child: Texts.regular(
                          reference.domain,
                          fontSize: 9,
                        ),
                      ),
                    ],
                  ).only(bottom: 1.h),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Texts.regular(
                        reference.description,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              final uri = Uri.parse(reference.link);
              await launchUrl(uri);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Palette.black,
            ),
            child: Texts.bold(
              "Ver más",
              fontSize: 9,
              color: Palette.white,
            ),
          ).only(top: 1.h),
        ],
      ),
    );
  }

  String getIcon(String source) {
    switch (source) {
      case 'google-scholar':
        return "assets/google.png";
      default:
        return "assets/google.png";
    }
  }
}
