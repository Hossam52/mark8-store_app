import 'package:common_widgets/border_container_light.dart';
import 'package:flutter/material.dart';
import 'package:store_app/general_commponent/components.dart';
import 'package:store_app/presentation/resourses/color_manager.dart';
import 'package:store_app/presentation/resourses/styles_manager.dart';
import 'package:store_app/screens/notifications/notification_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:store_app/widgets/cover_and_profile_image.dart';
// import 'package:store_app/widgets/table_data_widget.dart';
// import 'package:store_app/widgets/notification_badge.dart';
import 'package:common_widgets/cover_and_profile_image.dart';
import 'package:common_widgets/table_data_widget.dart';
import 'package:common_widgets/notification_badge.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key, required this.profileData}) : super(key: key);

  final ProfileDataConfigs profileData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CoverProfileImage(
            id: profileData.profileId,
            endWidget: profileData.showBackButton
                ? BackButton(
                    color: Theme.of(context).primaryColor,
                  )
                : Container(),
            startWidget: profileData.showNotificationButton
                ? NotificationBadge(
                    onPressed: () => To(context, NotificationScreen()),
                  )
                : Container(),
            coverImagePath: profileData.coverImagePath,
            profileImagePath: profileData.imagePath,
            totalHeight: 200.h,
            radius: 60.r,
          ),
          SizedBox(height: 20),
          Text(profileData.title ?? '',
              style:
                  getRegularStyle(color: ColorManager.lightGrey, fontSize: 18)),
          TableDataWidget(
            rows: profileData.detailsTable,
            titleSize: profileData.tableTitleSizeFactor,
            valueSize: profileData.tableValueSizeFactor,
          ),
          if (profileData.showDiscription) _storeDescription()
        ],
      ),
    );
  }

  Widget _storeDescription() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Store description', style: getRegularStyle(fontSize: 18)),
          Container(
            padding: const EdgeInsets.all(10),
            constraints: BoxConstraints(minHeight: 100),
            child: BorderContainerLight(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Hello This is description for the store hossam',
                  style: getRegularStyle(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ProfileDataConfigs {
  final String? title;
  final List<TableRowItem> detailsTable;
  final String coverImagePath;
  final String imagePath;
  final bool showDiscription;
  final bool showNotificationButton;
  final bool showBackButton;
  final double tableTitleSizeFactor;
  final double tableValueSizeFactor;
  final String? profileId;

  ProfileDataConfigs({
    this.title,
    required this.detailsTable,
    required this.coverImagePath,
    required this.imagePath,
    this.profileId,
    this.showDiscription = true,
    this.showBackButton = true,
    this.showNotificationButton = false,
    this.tableTitleSizeFactor = 3,
    this.tableValueSizeFactor = 3,
  });
}
