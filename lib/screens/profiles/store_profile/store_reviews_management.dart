import 'package:flutter/material.dart';
import 'package:store_app/models/review_model.dart';
import 'package:store_app/screens/profiles/store_profile/store_reviews.dart';
// import 'package:store_app/models/morag3at_model.dart';
// import 'package:store_app/widgets/morag3at.dart';
// import 'package:store_app/widgets/custom_toggle_buttons.dart';
import 'package:common_widgets/morag3at_model.dart';
import 'package:common_widgets/morag3at.dart';
import 'package:common_widgets/custom_toggle_buttons.dart';

class StoreReviewsManagement extends StatefulWidget {
  const StoreReviewsManagement(
      {Key? key, required this.driverReviewModel, required this.morag3atModel})
      : super(key: key);
  final DriverReviewModel driverReviewModel;
  final List<Morag3atModel> morag3atModel;
  @override
  State<StoreReviewsManagement> createState() => _StoreReviewsManagementState();
}

class _StoreReviewsManagementState extends State<StoreReviewsManagement> {
  @override
  void initState() {
    _reviewsTabs = [
      ToggleItemDataWithWidget(
          title: 'Reviews',
          onPressed: () => onChangeSelected(0),
          page: StoreReviews(
            driverReviewModel: widget.driverReviewModel,
          )),
      ToggleItemDataWithWidget(
          title: 'Morag3at',
          onPressed: () => onChangeSelected(1),
          page: Morag3atWidget(morg3at: widget.morag3atModel)),
    ];
    super.initState();
  }

  late List<ToggleItemDataWithWidget> _reviewsTabs;

  int _selectedTabIndex = 0;

  void onChangeSelected(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Text('Hello man')
            _toggleButtons(),
            Expanded(child: _reviewsTabs[_selectedTabIndex].page)
          ],
        ),
      ),
    );
  }

  Widget _toggleButtons() {
    return CustomToggleButtons(
        tabs: _reviewsTabs, selectedIndex: _selectedTabIndex);
  }
}
