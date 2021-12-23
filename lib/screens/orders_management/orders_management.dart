import 'package:store_app/cubits/orders_management/orders_management_cubit.dart';
import 'package:store_app/screens/orders_management/in_progress_orders/progress_orders_management.dart';
import 'package:store_app/screens/orders_management/income_orders/income_orders_management.dart';
import 'package:store_app/screens/orders_management/prepare_orders/prepare_orders_management.dart';
// import 'package:store_app/widgets/appbar_with_ToggleButtons.dart';
// import 'package:store_app/widgets/custom_toggle_buttons.dart';
import 'package:common_widgets/appbar_with_toggle_buttons.dart';
import 'package:common_widgets/custom_toggle_buttons.dart';
import 'package:flutter/material.dart';

class OrdersManagement extends StatefulWidget {
  OrdersManagement({Key? key}) : super(key: key);

  @override
  State<OrdersManagement> createState() => _OrdersManagementState();
}

class _OrdersManagementState extends State<OrdersManagement> {
  @override
  void initState() {
    ordersStates = [
      ToggleItemDataWithWidget(
          title: 'Income orders',
          onPressed: () => onChangeIndex(0),
          page: IncomeOrdersManagement()),
      ToggleItemDataWithWidget(
          title: 'Preparing orders',
          onPressed: () => onChangeIndex(1),
          page: PrepareOrdersManagement()),
      ToggleItemDataWithWidget(
          title: 'Orders in progress',
          onPressed: () => onChangeIndex(2),
          page: ProgressOrdersManagement()),
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
    return OrdersManagementBlocProvider(
      create: (context) => OrdersManagementCubit(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: OrdersManagementBlocBuilder(
            builder: (_, cubit) => SafeArea(
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
          ),
        );
      }),
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
