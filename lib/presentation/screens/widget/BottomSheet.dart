// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:hackathon_talents/routes/app_router.dart';
// import 'package:hackathon_talents/routes/screen_name.dart';
// import 'package:hackathon_talents/utils/constant/icons_constant.dart';
// import '../../utils/constant/colors_manger.dart';
// import '../../utils/constant/sizes_in_app.dart';
//
// class ContentOfBottomSheet extends StatefulWidget {
//   const ContentOfBottomSheet({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<ContentOfBottomSheet> createState() => _ContentOfBottomSheetState();
// }
//
// class _ContentOfBottomSheetState extends State<ContentOfBottomSheet> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
//       child: ListView(
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         children: [
//           const Text(
//             'Payment Method',
//             style: TextStyle(
//               fontFamily: 'Segoe UI',
//               fontSize: AppSizes.textLarge,
//               color: Color(AppColor.gray),
//             ),
//           ),
//           const SizedBox(
//             height: 15,
//           ),
//           const Divider(
//             height: 0.5,
//             thickness: 0.5,
//             color: Color(0xFF707070),
//           ),
//           const SizedBox(
//             height: 16,
//           ),
//           InkWell(
//             onTap: () {
//               AppRouter.goTo(screenName: ScreenName.withdrawRequestBankScreen);
//             },
//             child: Row(
//               children: [
//                 const Text(
//                   'Bank',
//                   style: TextStyle(
//                       fontFamily: 'Segoe UI',
//                       fontSize: AppSizes.textSemiLarge,
//                       color: Color(AppColor.primaryTextColor),
//                       fontWeight: FontWeight.w600),
//                 ),
//                 const SizedBox(
//                   width: 30,
//                 ),
//                 SizedBox(
//                   height: 25,
//                   width: 25,
//                   child: SvgPicture.asset(IconsConstant.bank),
//                 )
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           InkWell(
//             onTap: () {
//               AppRouter.goTo(screenName: ScreenName.withdrawRequestCashScreen);
//             },
//             child: Row(
//               children: [
//                 const Text(
//                   'Cash',
//                   style: TextStyle(
//                       fontFamily: 'Segoe UI',
//                       fontSize: AppSizes.textSemiLarge,
//                       color: Color(AppColor.primaryTextColor),
//                       fontWeight: FontWeight.w600),
//                 ),
//                 const SizedBox(
//                   width: 30,
//                 ),
//                 SizedBox(
//                   height: 28,
//                   width: 28,
//                   child: SvgPicture.asset(IconsConstant.money),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 8,
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// /*
// showModalBottomSheet(
//             shape: const OutlineInputBorder(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(15),
//                   topRight: Radius.circular(15),
//                 ),
//                 borderSide: BorderSide.none),
//             backgroundColor: Colors.white,
//             context: context,
//             isScrollControlled: true,
//             builder: (context) => SizedBox(
//               child: ContentOfBottomSheet(
//                 midea: MediaQuery.of(context).size,
//               ),
//             ),
//           );
//  */
