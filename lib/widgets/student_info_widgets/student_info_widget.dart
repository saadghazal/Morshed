import 'package:abwaab_practice/widgets/student_info_widgets/slot_separator.dart';
import 'package:abwaab_practice/widgets/student_info_widgets/student_info_header.dart';
import 'package:abwaab_practice/widgets/student_info_widgets/student_info_slot.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class StudentInfoWidgetLarge extends StatelessWidget {
  const StudentInfoWidgetLarge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Container(
            height: 14,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                topLeft: Radius.circular(16),
              ),
              color: AppColors.blue600,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          StudentInfoHeader(),
          SlotSeparator(),
          StudentInfoSlot(
            title: 'تاريخ الاشتراك:',
            value: '12-05-2024',
            multipleInfo: true,
            infos: [
              StudentInfo(title: 'الأسبوع:', value: '#2'),
            ],
          ),
          SlotSeparator(),
          StudentInfoSlot(
            title: 'الشخصية:',
            value: 'باسم',
          ),
          SlotSeparator(),
          StudentInfoSlot(
            title: 'أهم المواد:',
            value: 'الرياضيات، اللغة الإنجليزية، العلوم، مهارات الاتصال',
          ),
          SlotSeparator(),
          StudentInfoSlot(
            title: 'الهدف:',
            value: 'الحصول على العلامة الكاملة',
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class StudentInfoWidgetMobile extends StatefulWidget {
  const StudentInfoWidgetMobile({
    super.key,
  });

  @override
  State<StudentInfoWidgetMobile> createState() => _StudentInfoWidgetMobileState();
}

class _StudentInfoWidgetMobileState extends State<StudentInfoWidgetMobile> {
  bool toggle = false;
  openCloseWidget() {
    setState(() {
      toggle = !toggle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Container(
            height: 14,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                topLeft: Radius.circular(16),
              ),
              color: AppColors.blue600,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          StudentInfoHeader(),
          SlotSeparator(),
          StudentInfoSlot(
            title: 'تاريخ الاشتراك:',
            value: '12-05-2024',
            multipleInfo: true,
            infos: [
              StudentInfo(title: 'الأسبوع:', value: '#2'),
            ],
          ),
          Visibility(
            visible: toggle,
            replacement: toggleWidget(),
            child: Column(
              children: [
                SlotSeparator(),
                StudentInfoSlot(
                  title: 'الشخصية:',
                  value: 'باسم',
                ),
                SlotSeparator(),
                StudentInfoSlot(
                  title: 'أهم المواد:',
                  value: 'الرياضيات، اللغة الإنجليزية، العلوم، مهارات الاتصال',
                ),
                SlotSeparator(),
                StudentInfoSlot(
                  title: 'الهدف:',
                  value: 'الحصول على العلامة الكاملة',
                ),
                SizedBox(
                  height: 10,
                ),
                toggleWidget(),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  InkWell toggleWidget() {
    return InkWell(
      onTap: openCloseWidget,
      child: Container(
        height: 24,
        width: 24,
        margin: EdgeInsets.only(bottom: 8, top: 10),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.blue50,
        ),
        child: Center(
          child: RotatedBox(
            quarterTurns: !toggle ? 0 : 2,
            child: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.blue600,
            ),
          ),
        ),
      ),
    );
  }
}
