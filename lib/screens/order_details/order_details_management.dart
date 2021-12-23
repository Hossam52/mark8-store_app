import 'package:common_widgets/profile.dart';
import 'package:flutter/material.dart';
import 'package:store_app/presentation/resourses/color_manager.dart';
import 'package:store_app/screens/order_details/order_details.dart';
// import 'package:store_app/widgets/table_data_widget.dart';
// import 'package:store_app/widgets/indicator_widget.dart';
import 'package:common_widgets/indicator_widget.dart';
import 'package:common_widgets/table_data_widget.dart';

class OrderDetailsManagement extends StatefulWidget {
  const OrderDetailsManagement({Key? key, this.index = 0}) : super(key: key);
  final int index;

  @override
  State<OrderDetailsManagement> createState() => _OrderDetailsManagementState();
}

class _OrderDetailsManagementState extends State<OrderDetailsManagement> {
  late final PageController _pagesController;

  @override
  void initState() {
    _pagesController = PageController(initialPage: widget.index);
    ;
    super.initState();
  }

  late final List<Widget> _screens = [
    ProfileStructure(
      profileData: ProfileDataConfigs(
          coverImagePath: 'asset/images/coverProfile.png',
          imagePath: 'asset/images/userProfile.png',
          detailsTable: getShopperDetails,
          profileId: '1115425561',
          showBackButton: true,
          showDiscription: false,
          tableValueSizeFactor: 6,
          title: 'Recieptient details'),
    ),
    OrderDetails(),
  ];
  List<TableRowItem> get getShopperDetails {
    return [
      TableRowItem(title: 'Name', widget: Text('Hossam Hassan')),
      TableRowItem(title: 'Nickname', widget: Text('Hoso')),
      TableRowItem(title: 'ID', widget: Text('542')),
      TableRowItem(title: 'Nationality', widget: Text('Egyption')),
      TableRowItem(title: 'Address', widget: Text('Egypt cairo qalyobia')),
      TableRowItem(title: 'Gender', widget: Text('Male')),
      TableRowItem(title: 'Age', widget: Text('30')),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(controller: _pagesController, children: _screens),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IndicatorWidget(
                dotColor: ColorManager.grey,
                activeColor: Theme.of(context).primaryColor,
                pageController: _pagesController,
                count: _screens.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
