import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_flutter_bloc_chat/src/core/constants/spacings.dart';
import 'package:test_flutter_bloc_chat/src/core/extensions/integer_sizedbox_extension.dart';
import 'package:test_flutter_bloc_chat/src/widgets/loading_widget.dart';

import '../../../../configs/injector/injector_conf.dart';
import '../../../../core/blocs/theme/theme_bloc.dart';
import '../../../../core/themes/app_color.dart';
import '../../../../routes/app_route_conf.dart';
import '../../../../widgets/snackbar_widget.dart';
import '../bloc/home/home_bloc.dart';
import '../widgets/chat_item.dart';
import '../widgets/search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final router = getIt<AppRouteConf>().router;
    final isDarkMode = context.read<ThemeBloc>().state.isDarkMode;

    return Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            58.hS,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: defaultHorPadding.w,
              ),
              child: Text(
                'chats'.tr(),
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w600,
                  color: isDarkMode ? Colors.white : AppColors.black1,
                ),
              ),
            ),
            6.hS,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: defaultHorPadding.w,
              ),
              child: SearchWidget(
                callback: (val) {},
              ),
            ),
            24.hS,
            Divider(
              color: AppColors.grey1,
              height: 0.0,
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async => getIt<HomeBloc>().add(GetChatsEvent()),
                child: BlocConsumer<HomeBloc, HomeState>(
                  listener: (context, state) {
                    if (state is GetChatsFailureState) {
                      appSnackBar(context, Colors.red, state.message);
                    }
                  },
                  builder: (context, state) {
                    if (state is GetChatsSuccessState) {
                      final chats = state.response.data ?? [];

                      return ListView.separated(
                        itemCount: chats.length,
                        padding: EdgeInsets.symmetric(
                          horizontal: defaultHorPadding.w,
                        ),
                        separatorBuilder: (_, i) => Divider(
                          color: AppColors.grey1,
                          height: 0.0,
                        ),
                        itemBuilder: (_, i) {
                          return ChatItem(
                            index: i,
                            item: chats[i],
                            callback: () {},
                          );
                        },
                      );
                    }
                    return AppLoadingWidget(isMini: false);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
