import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/models/company_model.dart';
import 'package:store_app/models/driver_model.dart';
import 'package:store_app/models/vehicle_model.dart';
// import 'package:store_app/screens/profiles/profile_screen.dart';
// import 'package:store_app/widgets/indicator_widget.dart';
// import 'package:store_app/widgets/rating_row.dart';
import 'package:common_widgets/indicator_widget.dart';
import 'package:common_widgets/rating_row.dart';
// import 'package:store_app/widgets/table_data_widget.dart';
import 'package:common_widgets/table_data_widget.dart';
import 'package:common_widgets/profile.dart';

class DriverProfileManagement extends StatelessWidget {
  DriverProfileManagement(this.configs, {Key? key})
      : driverInfo = configs.driverModel,
        companyInfo = configs.driverModel.comapny,
        vehicleInfo = configs.driverModel.vehicle,
        super(key: key) {
    storeInformations = [
      ProfileStructure(
        profileData: ProfileDataConfigs(
            tableTitleSizeFactor: 2,
            tableValueSizeFactor: 4,
            imagePath: driverInfo.imagePath,
            coverImagePath: driverInfo.coverImagePath,
            detailsTable: getDriverInformation,
            showBackButton: true,
            showDiscription: false),
      ),
      ProfileStructure(
          profileData: ProfileDataConfigs(
              tableValueSizeFactor: 4,
              imagePath: companyInfo.imagePath,
              coverImagePath: companyInfo.coverImagePath,
              detailsTable: getCompnayInformation,
              showBackButton: false)),
      ProfileStructure(
          profileData: ProfileDataConfigs(
              tableValueSizeFactor: 5,
              imagePath: vehicleInfo.imagePath,
              coverImagePath: vehicleInfo.coverImagePath,
              detailsTable: getVehicleDetails,
              showDiscription: false,
              showBackButton: false)),
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

  List<TableRowItem> get getCompnayInformation {
    return [
      TableRowItem(title: 'Company name', widget: Text('${companyInfo.name}')),
      TableRowItem(
          title: 'Delivery type', widget: Text('${companyInfo.deliveryType}')),
      TableRowItem(
          title: 'Number vehicles',
          widget: Text('${companyInfo.vehiclesCount}')),
      TableRowItem(
        title: 'Rating',
        widget: RatingRow(
          rating: companyInfo.rating,
          size: 20.w,
        ),
      ),
      TableRowItem(
          title: 'Company address',
          widget:
              Text('Cairo egypt qalyobia shoubra elkima sakkara from delhi')),
    ];
  }

  List<TableRowItem> get getVehicleDetails {
    return [
      TableRowItem(title: 'Vehicle type', widget: Text('${vehicleInfo.type}')),
      TableRowItem(title: 'Model', widget: Text('${vehicleInfo.model}')),
      TableRowItem(
          title: 'Load/Order', widget: Text('${vehicleInfo.loadPerOrder}')),
      TableRowItem(
          title: 'Vehicle classification',
          widget: Text('${vehicleInfo.classification}')),
      TableRowItem(
          title: 'Pannel number', widget: Text('${vehicleInfo.model}')),
      TableRowItem(title: 'Owner', widget: Text('${vehicleInfo.owner}')),
    ];
  }

  late final List<Widget> storeInformations;
  final _pagesController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                  controller: _pagesController, children: storeInformations),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IndicatorWidget(
                activeColor: Theme.of(context).primaryColor,
                pageController: _pagesController,
                count: storeInformations.length,
              ),
            ),
            configs.bottomButton ?? Container()
          ],
        ),
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
