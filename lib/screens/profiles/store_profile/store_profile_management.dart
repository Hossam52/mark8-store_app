import 'package:store_app/general_commponent/components.dart';
import 'package:store_app/models/company_model.dart';
import 'package:store_app/models/driver_model.dart';
import 'package:store_app/models/vehicle_model.dart';
import 'package:store_app/presentation/resourses/assets_manager.dart';
import 'package:store_app/presentation/resourses/color_manager.dart';
import 'package:store_app/presentation/resourses/styles_manager.dart';
import 'package:store_app/screens/notifications/notification_screen.dart';
import 'package:store_app/screens/profiles/store_profile/store_reviews_management.dart';
// import 'package:store_app/widgets/indicator_widget.dart';
// import 'package:store_app/widgets/rating_row.dart';
// import 'package:store_app/widgets/table_data_widget.dart';
import 'package:flutter/material.dart';

// import 'package:store_app/widgets/indicator_widget.dart';
// import 'package:store_app/widgets/rating_row.dart';
import 'package:common_widgets/indicator_widget.dart';
import 'package:common_widgets/rating_row.dart';
import 'package:common_widgets/table_data_widget.dart';
import 'package:common_widgets/profile.dart';

class StoreProfileManagement extends StatelessWidget {
  StoreProfileManagement(this.configs, {Key? key})
      : driverInfo = configs.driverModel,
        companyInfo = configs.driverModel.comapny,
        vehicleInfo = configs.driverModel.vehicle,
        super(key: key) {
    storeInformations = [
      Builder(builder: (context) {
        return ProfileStructure(
          profileData: ProfileDataConfigs(
              imagePath: driverInfo.imagePath,
              coverImagePath: driverInfo.coverImagePath,
              detailsTable: getDriverInformation,
              showBackButton: false,
              onNotificationPressed: () {
                To(context, NotificationScreen());
              },
              showDiscription: false),
        );
      }),
      ProfileStructure(
          profileData: ProfileDataConfigs(
              imagePath: vehicleInfo.imagePath,
              coverImagePath: vehicleInfo.coverImagePath,
              detailsTable: getStoreInfo,
              showDiscription: true,
              showBackButton: false,
              tableValueSizeFactor: 6,
              tableTitleSizeFactor: 4)),
      StoreReviewsManagement(
        driverReviewModel: driverInfo.reviews,
        morag3atModel: driverInfo.morag3at,
      ),
    ];
  }
  final DriverScreenConfigs configs;
  final DriverModel driverInfo;
  final CompanyModel companyInfo;
  final VehicleModel vehicleInfo;
  List<TableRowItem> get getDriverInformation {
    return [
      TableRowItem(
          title: 'Employment number',
          widget: Text(driverInfo.employmentNumber)),
      TableRowItem(title: 'Name', widget: Text(driverInfo.name)),
      TableRowItem(title: 'Type', widget: Text(driverInfo.type)),
      TableRowItem(title: 'Work', widget: Text(driverInfo.work)),
      TableRowItem(title: 'Age', widget: Text(driverInfo.age.toString())),
      TableRowItem(title: 'Gender', widget: Text(driverInfo.gender)),
      TableRowItem(
          title: 'Experience', widget: Text('${driverInfo.experience}')),
      TableRowItem(
          title: 'Nationality', widget: Text('${driverInfo.nationality}')),
      TableRowItem(title: 'Points', widget: Text('${driverInfo.points}')),
      TableRowItem(
          title: 'Best buyer', widget: Text('${driverInfo.bestBuyer}')),
    ];
  }

  List<TableRowItem> get getStoreInfo => [
        TableRowItem(
            title: 'Store name',
            widget: Text(
              'Starbuck',
              style: getRegularStyle(fontSize: 16),
            )),
        TableRowItem(
            title: 'Store type',
            widget: Text(
              'Resturant',
              style: getRegularStyle(fontSize: 16),
            )),
        TableRowItem(
            title: 'Selling type',
            widget: Text(
              'Fast food',
              style: getRegularStyle(fontSize: 16),
            )),
        TableRowItem(title: 'Rating', widget: RatingRow(size: 25)),
        TableRowItem(title: 'Store address', widget: address()),
      ];
  Widget address() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Center(
            child: Text(
              "Oman Makka st 16511, Doar el sha3b hady bady",
              maxLines: 1,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: getRegularStyle(
                fontSize: 18,
                color: Colors.grey.shade700,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(ImageAssets.mapIcon),
              Text(
                "On map",
                style: getRegularStyle(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  late final List<Widget> storeInformations;
  final _pagesController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
                controller: _pagesController, children: storeInformations),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IndicatorWidget(
              dotColor: ColorManager.grey,
              pageController: _pagesController,
              count: storeInformations.length,
            ),
          ),
          configs.bottomButton ?? Container()
        ],
      ),
    );
  }
}

class DriverScreenConfigs {
  final Widget? bottomButton;
  final DriverModel driverModel;

  DriverScreenConfigs(
    this.driverModel, {
    this.bottomButton,
  });
}
