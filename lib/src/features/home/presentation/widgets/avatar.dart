import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/app_color.dart';
import '../../data/models/user.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    super.key,
    required this.index,
    required this.user,
  });

  final int index;
  final UserModel user;

  static final List<Color> _avatarColors = [
    AppColors.green1,
    AppColors.orange1,
    AppColors.blue1,
  ];

  @override
  Widget build(BuildContext context) {
    final shortName =
        '${user.name.split(' ')[0][0]}${user.name.split(' ')[1][0]}';
    final avatarColor = _avatarColors[index % _avatarColors.length];

    return Container(
      width: 50.w,
      height: 50.w,
      decoration: BoxDecoration(
        color: avatarColor,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          shortName,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
