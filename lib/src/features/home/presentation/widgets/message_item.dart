import 'package:bubble/bubble.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_flutter_bloc_chat/src/core/extensions/integer_sizedbox_extension.dart';
import 'package:test_flutter_bloc_chat/src/core/themes/app_color.dart';
import 'package:test_flutter_bloc_chat/src/features/home/data/models/message.dart';

import '../../../../core/blocs/theme/theme_bloc.dart';
import '../../../../core/constants/others.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({
    super.key,
    required this.item,
  });

  final MessageModel item;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDarkMode = context.read<ThemeBloc>().state.isDarkMode;
    final createdAt = DateTime.fromMillisecondsSinceEpoch(item.createdAt);
    final sentAt = DateFormat('HH:mm').format(createdAt);
    final isMe = item.authorId == myId;
    final hasImage = item.image != null;

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Bubble(
        nip: isMe ? BubbleNip.rightBottom : BubbleNip.leftBottom,
        color: isMe
            ? isDarkMode
                ? AppColors.green1
                : AppColors.green1
            : isDarkMode
                ? AppColors.grey1
                : AppColors.grey1,
        radius: Radius.circular(21.r),
        padding: BubbleEdges.all(0),
        margin: BubbleEdges.only(
          left: isMe ? size.width / 6 : 0.0,
          right: isMe ? 0.0 : size.width / 6,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (hasImage)
              Padding(
                padding: EdgeInsets.only(top: 4.h, left: 4.h, right: 4.h),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(19.r),
                    topRight: Radius.circular(19.r),
                    bottomLeft: Radius.circular(8.r),
                    bottomRight: Radius.circular(8.r),
                  ),
                  child: Image.asset(
                    item.image!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            Padding(
              padding: EdgeInsets.only(
                top: hasImage ? 8.h : 12.h,
                bottom: hasImage ? 10.h : 12.h,
                left: hasImage ? 14.h : 16.w,
                right: hasImage ? 10.h : 12.w,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Flexible(
                    fit: hasImage ? FlexFit.tight : FlexFit.loose,
                    child: Text(
                      item.text,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        height: 1.2,
                        color: isMe
                            ? isDarkMode
                                ? AppColors.green2
                                : AppColors.green2
                            : isDarkMode
                                ? AppColors.black1
                                : AppColors.black1,
                      ),
                    ),
                  ),
                  12.wS,
                  Text(
                    sentAt,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      height: 1.2,
                      color: isMe
                          ? isDarkMode
                              ? AppColors.green2
                              : AppColors.green2
                          : isDarkMode
                              ? AppColors.black1
                              : AppColors.black1,
                    ),
                  ),
                  3.wS,
                  Icon(
                    item.isRead ? Icons.done_all_rounded : Icons.done_rounded,
                    size: 14.w,
                    color: isMe
                        ? isDarkMode
                            ? AppColors.green2
                            : AppColors.green2
                        : isDarkMode
                            ? AppColors.black1
                            : AppColors.black1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
