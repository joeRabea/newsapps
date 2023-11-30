import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:insights_news/app_color.dart';


class NewsListView extends StatelessWidget {
  const NewsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            height: 100,
            decoration: BoxDecoration(
                color: AppColor.containerBG,
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/rodri.jpg',
                    width: 160,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'a skja aslkdna aslkdnas l;asjda ;asjda ;safjas as;lfjas;fa',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(fontSize: 14),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset('assets/read.svg'),
                            const SizedBox(
                              width: 5,
                            ),
                            Text('Read',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(color: AppColor.white))
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
        itemCount: 8);
  }
}
