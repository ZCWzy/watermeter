import 'package:flutter/material.dart';
import 'package:watermeter/page/widget.dart';
import 'package:watermeter/model/xidian_directory/telephone.dart';
import 'package:watermeter/repository/xidian_directory/xidian_directory_session.dart';

var list = getTelephoneData();

/// Intro of the telephone book (address book if you want).
class TeleBookWindow extends StatelessWidget {
  const TeleBookWindow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return dataList<TeleyInformation, DepartmentWindow>(
        list, (a) => DepartmentWindow(a));
  }
}

/// Each entry of the telephone book is shown in a card,
/// which stored in an information class called [TeleyInformation].
class DepartmentWindow extends StatelessWidget {
  late final TeleyInformation toUse;
  final List<Widget> mainCourse = [];

  DepartmentWindow(TeleyInformation toUse, {Key? key}) : super(key: key) {
    mainCourse.addAll(
      [
        Text(
          toUse.title,
          textScaleFactor: 1.25,
          textAlign: TextAlign.left,
        ),
      ],
    );

    if (toUse.isNorth == true) {
      mainCourse.add(const SizedBox(height: 5));
      mainCourse.add(InsideWindow(
        address: toUse.northAddress,
        phone: toUse.northTeley,
      ));
    }
    if (toUse.isSouth == true) {
      mainCourse.add(const SizedBox(height: 5));
      mainCourse.add(InsideWindow(
          address: toUse.southAddress, phone: toUse.southTeley, isSouth: true));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(12.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: mainCourse,
        ),
      ),
    );
  }
}

/// Each element of the card is created in here.
/// Needs the information, I am tired to tell.
class InsideWindow extends StatelessWidget {
  final String? address;
  final String? phone;
  final bool isSouth;

  const InsideWindow(
      {Key? key,
      required this.address,
      required this.phone,
      this.isSouth = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isSouth ? "南校区" : "北校区",
          textAlign: TextAlign.left,
          textScaleFactor: 1.00,
        ),
        if (address != null)
          Row(
            children: [
              const SizedBox(width: 10),
              const Icon(Icons.house),
              const SizedBox(width: 5),
              Text(address!)
            ],
          ),
        if (phone != null)
          Row(
            children: [
              const SizedBox(width: 10),
              const Icon(Icons.phone),
              const SizedBox(width: 5),
              Text(phone!)
            ],
          )
      ],
    );
  }
}
