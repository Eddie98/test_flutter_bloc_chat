import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_flutter_bloc_chat/src/core/extensions/integer_sizedbox_extension.dart';

import '../../../../core/blocs/theme/theme_bloc.dart';
import '../../../../core/constants/others.dart';
import '../../../../core/themes/app_color.dart';
import '../../data/models/chat.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({
    super.key,
    required this.index,
    required this.item,
    required this.callback,
  });

  final int index;
  final ChatModel item;
  final VoidCallback callback;

  static final List<Color> _avatarColors = [
    AppColors.green1,
    AppColors.orange1,
    AppColors.blue1,
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.read<ThemeBloc>().state.isDarkMode;
    final otherUser = item.users.singleWhere((e) => e.id != myId);

    String message = '';

    if (item.messages.isNotEmpty) {
      final fwefew = item.messages.last.text;
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.w),
      child: Row(
        children: [
          Container(
            width: 50.w,
            height: 50.w,
            decoration: BoxDecoration(
              color: _avatarColors[index % _avatarColors.length],
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                '${otherUser.name.split(' ')[0][0]}${otherUser.name.split(' ')[1][0]}',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          12.wS,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                otherUser.name,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '${'you'.tr()}: ',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: message,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
