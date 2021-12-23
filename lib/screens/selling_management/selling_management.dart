import 'package:flutter/material.dart';
import 'package:store_app/screens/selling_management/sepcial_products.dart';
import 'package:store_app/screens/selling_management/store_work.dart';
import 'package:store_app/screens/selling_management/style_products.dart';
// import 'package:store_app/widgets/appbar_with_ToggleButtons.dart';
// import 'package:store_app/widgets/custom_toggle_buttons.dart';
import 'package:common_widgets/appbar_with_toggle_buttons.dart';
import 'package:common_widgets/custom_toggle_buttons.dart';

class SellingManagement extends StatefulWidget {
  const SellingManagement({Key? key}) : super(key: key);

  @override
  _SellingManagementState createState() => _SellingManagementState();
}

class _SellingManagementState extends State<SellingManagement> {
  @override
  void initState() {
    ordersStates = [
      ToggleItemDataWithWidget(
          title: 'Store work',
          onPressed: () => onChangeIndex(0),
          page: StoreWork()),
      ToggleItemDataWithWidget(
          title: 'Product styling',
          onPressed: () => onChangeIndex(1),
          page: StyleProducts()),
      ToggleItemDataWithWidget(
          title: 'Special products',
          onPressed: () => onChangeIndex(2),
          page: SpecialProducts()),
    ];
    super.initState();
  }

  late List<ToggleItemDataWithWidget> ordersStates;

  int selectedIndex = 0;
  void onChangeIndex(int index) {
    controller.jumpToPage(index);
    setState(() {
      selectedIndex = index;
    });
  }

  final controller = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildToggleButtons(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: PageView(
                  controller: controller,
                  children: ordersStates.map((e) => e.page).toList(),
                  onPageChanged: (index) {
                    setState(() {
                      onChangeIndex(index);
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButtons() {
    final toggleButtons = CustomToggleButtons(
      tabs: ordersStates,
      selectedIndex: selectedIndex,
    );
    return AppBarWithToggleButtons(toggleButtons: toggleButtons);
  }
}
