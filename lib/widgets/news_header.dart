import 'package:flutter/material.dart';

import '../app_color.dart';


class NewsHeaderWidget extends StatelessWidget {
  const NewsHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, Sayed',
              style: Theme.of(context).textTheme.displayMedium!,
            ),
            //
            Text(
              'Have A Nice Day.',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ],
        ),
        const Spacer(),
        CircleAvatar(
          radius: 26,
          backgroundColor: AppColor.white,
          child: const CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage('assets/rodri.jpg'),
          ),
        )
      ],
    );
  }
}
