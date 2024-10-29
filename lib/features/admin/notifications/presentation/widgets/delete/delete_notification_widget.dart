// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class DeleteNotificationWidget extends StatelessWidget {
//   const DeleteNotificationWidget({
//     // required this.notificationModel,
//     super.key,
//   });

//   // final AddNotificationModel notificationModel;

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<AddNotificationBloc, AddNotificationState>(
//       listener: (context, state) {
//         state.whenOrNull(
//           success: () {
//             context.read<GetAllNotificationAdminBloc>().add(
//                   const GetAllNotificationAdminEvent.getAllNotificion(),
//                 );
//           },
//         );
//       },
//       builder: (context, state) {
//         return state.maybeWhen(
//           loading: () {
//             return SizedBox(
//               height: 15.h,
//               width: 15.w,
//               child: const CircularProgressIndicator(
//                 color: ColorsDark.white,
//               ),
//             );
//           },
//           orElse: () {
//             return InkWell(
//               onTap: () {
//                 context.read<AddNotificationBloc>().add(
//                       AddNotificationEvent.deleteNotification(
//                         notificationModel: notificationModel,
//                       ),
//                     );
//               },
//               child: const Icon(
//                 Icons.delete,
//                 color: Colors.red,
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
