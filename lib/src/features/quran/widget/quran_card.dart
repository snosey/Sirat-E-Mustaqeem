import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sirat_e_mustaqeem/src/core/util/bloc/quran/quran_bloc.dart';
import 'package:sirat_e_mustaqeem/src/features/bookmark/bloc/category_bloc.dart';

import '../../../core/util/constants.dart';
import '../../../core/util/model/quran.dart';
import '../controller/quran_controller.dart';

class QuranCard extends StatelessWidget {
  const QuranCard(this.quran, {this.bookmarkScreen = false});

  final Quran quran;
  final bool bookmarkScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kPagePadding,
      child: Row(
        children: [
          GestureDetector(
            onTap: () async {
              await toggleQuranFavorite(context, quran);

              if (bookmarkScreen) {
                await Future.delayed(Duration.zero);

                BlocProvider.of<CategoryBloc>(context).add(
                  UpdateFavoriteItem(
                    qurans: BlocProvider.of<QuranBloc>(context).state.qurans,
                  ),
                );
              }
            },
            child: SvgPicture.asset(
              quran.favorite == 0
                  ? 'assets/images/navigation_icon/svg/bookmark_nfill.svg'
                  : 'assets/images/navigation_icon/svg/bookmark_fill.svg',
              color: Theme.of(context).primaryColor,
              width: 24.w,
            ),
          ),
          SizedBox(
            width: 16.w,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 16.h,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(context).colorScheme.background,
                    width: 2.sp,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${quran.arabicText}',
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                          fontFamily: 'uthman',
                        ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    '${quran.urduTranslation}',
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontFamily: 'jameel',
                        ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
