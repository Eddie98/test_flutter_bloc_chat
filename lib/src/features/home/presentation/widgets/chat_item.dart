import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_flutter_bloc_chat/src/core/extensions/integer_sizedbox_extension.dart';
import 'package:test_flutter_bloc_chat/src/features/home/data/models/message.dart';
import 'package:test_flutter_bloc_chat/src/features/home/data/models/user.dart';

import '../../../../core/blocs/theme/theme_bloc.dart';
import '../../../../core/constants/others.dart';
import '../../../../core/themes/app_color.dart';
import '../../data/models/chat.dart';
import 'avatar.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({
    super.key,
    required this.index,
    required this.item,
    required this.callback,
  });

  final int index;
  final ChatModel item;
  final void Function({
    required UserModel user,
  }) callback;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.read<ThemeBloc>().state.isDarkMode;
    final otherUser = item.users.singleWhere((e) => e.id != myId);

    return GestureDetector(
      onTap: () => callback(user: otherUser),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.w),
        color: Colors.transparent,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Row(
              children: [
                AvatarWidget(index: index, user: otherUser),
                12.wS,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        otherUser.name,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      if (item.messages.isNotEmpty)
                        _SubTitleWidget(message: item.messages.last),
                    ],
                  ),
                )
              ],
            ),
            if (item.messages.isNotEmpty)
              Positioned(
                child: _TimeAgoWidget(
                  timestamp: item.messages.last.createdAt,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _SubTitleWidget extends StatelessWidget {
  const _SubTitleWidget({required this.message});

  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.read<ThemeBloc>().state.isDarkMode;

    String text =
        message.text.isEmpty && message.image != null ? '🖼️' : message.text;
    bool isMe = message.authorId == myId;

    return RichText(
      maxLines: 2,
      text: TextSpan(
        children: [
          TextSpan(
            text: isMe ? '' : '${'you'.tr()}: ',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          TextSpan(
            text: text,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.grey2,
            ),
          ),
        ],
      ),
    );
  }
}

class _TimeAgoWidget extends StatelessWidget {
  const _TimeAgoWidget({required this.timestamp});

  final int timestamp;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    final diff = now.difference(dateTime);

    if (diff.inHours < 1) {
      return buildText(context.plural('minutes_ago', diff.inMinutes));
    } else if (diff.inHours >= 1 && diff.inHours < 24) {
      return buildText(DateFormat('HH:mm').format(dateTime));
    } else if (diff.inHours >= 24 && diff.inHours < 48) {
      return buildText('yesterday'.tr());
    }
    return buildText(DateFormat('dd:MM:yy').format(dateTime));
  }

  Widget buildText(String value) {
    return Text(
      value,
      style: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.grey2,
      ),
    );
  }
}
