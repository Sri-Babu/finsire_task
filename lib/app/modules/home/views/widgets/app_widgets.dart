// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:finsire_task1/app/cost/app_theme.dart';
import 'package:flutter/material.dart';

import '../../../../cost/app_images.dart';

class RoundedButton extends StatelessWidget {
  final IconData icon;
  final Function()? onPressed;
  final Color? bgColor;

  final Color? iconColor;

  const RoundedButton(
      {super.key,
      required this.icon,
      required this.onPressed,
      this.bgColor,
      this.iconColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(17),
      child: Container(
        margin: const EdgeInsets.all(08),
        padding: const EdgeInsets.all(08),
        decoration: BoxDecoration(
          color: AppTheme.bgIcon,
          borderRadius:
              BorderRadius.circular(17), // Adjust border radius as needed
          border:
              Border.all(color: bgColor ?? Colors.transparent), // Border color
        ),
        child: Icon(icon, color: iconColor ?? AppTheme.white),
      ),
    );
  }
}

Widget cardLable({required String lable}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: Text(
      lable,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}

Widget titleWidget() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.only(right: 10),
        child: buildAvatar(num: '2'),
      ),
      const Text(
        textAlign: TextAlign.center,
        "Amy's reader stats",
        style: TextStyle(
          color: AppTheme.white,
          fontSize: 18,
        ),
      ),
    ],
  );
}

Widget warAndPeace() {
  return Row(
    children: [
      Image.asset(
        AppImages.warAndPeace,
        height: 43,
        fit: BoxFit.contain,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 6),
        child: const Text(
          'War and Peace',
          style: TextStyle(
            color: AppTheme.white,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Spacer(),
      RoundedButton(
        icon: Icons.add,
        iconColor: AppTheme.white,
        onPressed: () {},
      ),
    ],
  );
}

Widget otherCard(
    {required Color cardColor,
    required String title,
    required BuildContext context,
    Widget? childRow,
    Widget? childColumn,
    Widget? cardTxtContent}) {
  return Container(
    decoration: BoxDecoration(
      color: cardColor,
      borderRadius: BorderRadius.circular(24),
    ),
    width: MediaQuery.sizeOf(context).width * 0.46,
    height: 200,
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    child: ListView(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: cardLable(
                lable: title,
              ),
            ),
            RoundedButton(
              icon: Icons.file_upload_outlined,
              iconColor: AppTheme.white,
              onPressed: () {},
            ),
          ],
        ),
        childRow ?? Container(),
        childColumn ?? Container(),
        cardTxtContent ?? Container(),
      ],
    ),
  );
}

Widget cardTxtContent({required String txt, required String bText}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          txt,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 12,
          ),
        ),
        Text(
          bText,
          style: const TextStyle(
              color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

Widget buildAvatar({String? gender, required String num}) {
  return CircleAvatar(
    radius: 15,
    backgroundImage: NetworkImage(
        'https://randomuser.me/api/portraits/${gender ?? 'women'}/$num.jpg'),
  );
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
