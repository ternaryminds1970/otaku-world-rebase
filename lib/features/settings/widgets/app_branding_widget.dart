import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otaku_world/utils/extensions.dart';

import '../../../generated/assets.dart';

class AppBrandingWidget extends StatelessWidget {
  const AppBrandingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SvgPicture.asset(
          Assets.assetsAppLogoHorizontal,
          width: MediaQuery.sizeOf(context).width - 100,
        ),
        10.height,
        const PoweredByAnilistText(),
      ],
    );
  }
}

class PoweredByAnilistText extends StatelessWidget {
  const PoweredByAnilistText({super.key});

  final baseTextStyle = const TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: baseTextStyle,
        children: const [
          TextSpan(
            text: 'Powered by ',
          ),
          TextSpan(
            text: 'AniList',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// class AppTextLogo extends StatelessWidget {
//   const AppTextLogo({super.key});
//
//   final TextStyle textStyle = const TextStyle(
//     color: AppColors.white,
//     fontSize: 36,
//     fontFamily: 'Anton',
//     fontWeight: FontWeight.w400,
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     return Text.rich(
//       TextSpan(
//         style: textStyle,
//         children: const [
//           TextSpan(
//             text: 'OTAKU ',
//           ),
//           TextSpan(
//             text: 'WORLD',
//             style: TextStyle(
//               color: AppColors.sunsetOrange,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
