// ignore_for_file: no_wildcard_variable_uses, prefer_const_constructors, must_be_immutable

import 'package:finsire_task1/app/cost/app_images.dart';
import 'package:finsire_task1/app/cost/app_theme.dart';
import 'package:finsire_task1/app/modules/home/views/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (HomeController _) {
      if (_.isLoading) return Center( child: CircularProgressIndicator( color: AppTheme.yello),);
      return Scaffold(
        backgroundColor: AppTheme.kPrimaryColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            child: ListView(
                children: [
              titleWidget(),
              warAndPeace(),
              progressCard(),
              const SizedBox(
                height: 2,
              ),
              // Other cards
              timeAndStreakCard(context),
              levelAndBadgeCard(context),
              bottomBtnwidget(),
              const Padding(
                padding: EdgeInsets.only(right: 100),
                child: Text(
                  'Leaderboard',
                  style: TextStyle(
                    color: AppTheme.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ]
                    .expand((element) => [
                          element,
                          const SizedBox(
                            height: 10,
                          )
                        ])
                    .toList()),
          ),
        ),
      );
    });
  }

  Widget bottomBtnwidget() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              elevation: 8,
              foregroundColor: Colors.white,
              backgroundColor: AppTheme.bgTransWhite,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            icon: const Icon(Icons.add),
            onPressed: () {},
            label: Text('Add Friends'),
          ),
        ),
        RoundedButton(
          icon: Icons.file_upload_outlined,
          onPressed: () {},
        ),
      ],
    );
  }

  Widget levelAndBadgeCard(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        otherCard(
          context: context,
          cardColor: AppTheme.purple,
          title: 'LEVEL',
          childRow: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                SizedBox(
                  height: 40,
                  child: Image.asset(AppImages.crown),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Text(
                    '2',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          cardTxtContent: cardTxtContent(
              txt: '145 reader points to level up!',
              bText: 'Top 5% for this book'),
        ),
        otherCard(
          context: context,
          cardColor: AppTheme.blue,
          title: 'Badges',
          childColumn: Column(
            children: [
              SizedBox(height: 17),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 40,
                    child: Image.asset(AppImages.idea),
                  ),
                  SizedBox(
                    height: 32,
                    child: Image.asset(AppImages.checked),
                  ),
                  SizedBox(
                    height: 32,
                    child: Image.asset(AppImages.cube),
                  ),
                ],
              ),
              SizedBox(
                height: 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 32,
                    child: Image.asset(AppImages.timer),
                  ),
                  SizedBox(
                    height: 32,
                    child: Image.asset(AppImages.markedBook),
                  ),
                  SizedBox(
                    height: 32,
                    child: Image.asset(AppImages.like),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget timeAndStreakCard(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        otherCard(
          context: context,
          cardColor: AppTheme.orange,
          title: 'TIME',
          childRow: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 40,
                  child: Image.asset(AppImages.clock),
                ),
                Text(
                  '6:24',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          cardTxtContent: cardTxtContent(
              txt: 'Global avg, read time for your progress 7:28',
              bText: '23% faster'),
        ),
        otherCard(
          context: context,
          cardColor: AppTheme.green,
          title: 'STREAK',
          childRow: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                SizedBox(
                  height: 40,
                  child: Image.asset(AppImages.thunder),
                ),
                Text(
                  '7',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          cardTxtContent: cardTxtContent(
              txt: 'Day Streak, come back tomorrow to keep it up!',
              bText: '19% more consistent'),
        ),
      ],
    );
  }

  Widget progressCard() {
    return GetBuilder(builder: (HomeController _) {
      return Container(
        decoration: BoxDecoration(
          color: AppTheme.yello,
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                cardLable(
                  lable: 'PROGRESS',
                ),
                RoundedButton(
                  icon: Icons.file_upload_outlined,
                  iconColor: AppTheme.white,
                  onPressed: () {},
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  height: 40,
                  child: Image.asset(AppImages.openBook),
                ),
                Text(
                  textAlign: TextAlign.start,
                  _.progressNumber,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                cardTxtContent(
                    txt: 'Out of 1,225 pages', bText: '#5 amoung friends'),
              ]
                  .expand(
                    (element) => [
                      element,
                      SizedBox(
                        width: 6,
                      )
                    ],
                  )
                  .toList(),
            ),
            SizedBox(
              height: 6,
            ),
            ProgressIndicatorWithAvatar(
              progress: 43, // 50% progress
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      );
    });
  }
}

class ProgressIndicatorWithAvatar extends StatelessWidget {
  final double progress;

  ProgressIndicatorWithAvatar({super.key, required this.progress});

  int total = 100;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 8,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 4,
                height: 15,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(0.5),
                ),
              ),
            ),
            Container(
              width: progress / total * MediaQuery.of(context).size.width,
              height: 8,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildAvatar(num: '1'),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: buildAvatar(num: '2', gender: 'men'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: buildAvatar(num: '2'),
            ),
            Align(
                alignment: Alignment.center,
                child: buildAvatar(num: '3', gender: 'men')),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.3 / 2.5,
                child: Stack(
                  children: [
                    buildAvatar(num: '7'),
                    Positioned(
                      left: 15,
                      child: buildAvatar(num: '4'),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: buildAvatar(num: '11', gender: 'men'),
            ),
          ],
        ),
      ],
    );
  }
}

// class ProgressIndicatorWithAvatars extends StatelessWidget {
//   final double progress;

//   const ProgressIndicatorWithAvatars({super.key, required this.progress});

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: Alignment.centerLeft,
//       children: [
//         Container(
//           width: 300,
//           height: 8,
//           decoration: BoxDecoration(
//             color: Colors.grey[300],
//             borderRadius: BorderRadius.circular(4),
//           ),
//         ),
//         Container(
//           width: 300 * progress,
//           height: 20,
//           decoration: BoxDecoration(
//             color: Colors.black,
//             borderRadius: BorderRadius.circular(4),
//           ),
//         ),
//         Positioned.fill(
//           left: 10,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               buildAvatar('https://randomuser.me/api/portraits/women/1.jpg'),
//               buildAvatar('https://randomuser.me/api/portraits/men/1.jpg'),
//               buildAvatar('https://randomuser.me/api/portraits/men/1.jpg'),
//               buildAvatar('https://randomuser.me/api/portraits/women/2.jpg'),
//               buildAvatar('https://randomuser.me/api/portraits/men/2.jpg'),
//               buildAvatar('https://randomuser.me/api/portraits/women/3.jpg'),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
