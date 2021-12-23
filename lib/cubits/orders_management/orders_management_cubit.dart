import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/orders_management/orders_management_states.dart';
import 'package:store_app/screens/orders_management/income_orders/income_orders_management.dart';
import 'package:store_app/screens/orders_management/prepare_orders/prepare_orders_management.dart';
// import 'package:store_app/widgets/custom_toggle_buttons.dart';
// import 'package:store_app/widgets/delivery_monaola_page.dart';
import 'package:common_widgets/custom_toggle_buttons.dart';
import 'package:common_widgets/delivery_monaola_page.dart';

typedef OrdersManagementBlocBuilder
    = BlocBuilder<OrdersManagementCubit, OrdersManagementStates>;
typedef OrdersManagementBlocProvider = BlocProvider<OrdersManagementCubit>;

class OrdersManagementCubit extends Cubit<OrdersManagementStates> {
  OrdersManagementCubit() : super(IntialOrdersManagementState()) {
    _initaizeData();
  }
  static OrdersManagementCubit instance(context) =>
      BlocProvider.of<OrdersManagementCubit>(context);
  void _initaizeData() {
    _orderStates = [
      ToggleItemDataWithWidget(
          title: 'Income orders',
          onPressed: _incomeOrdersOnPressed,
          page: IncomeOrdersManagement()),
      ToggleItemDataWithWidget(
          title: 'Preparing orders',
          onPressed: _prepareOrdersOnPressed,
          page: PrepareOrdersManagement()),
      ToggleItemDataWithWidget(
        title: 'Orders in progress',
        onPressed: _progressOrdersOnPressed,
        page: Container(),
      ),
    ];
  }

  late List<ToggleItemDataWithWidget> _orderStates;
  PageController get pagecontroller => PageController(initialPage: 0);
  Widget _incomeOrdersManagementWidget(
          {OrderRecievingType intitalType = OrderRecievingType.Delivery}) =>
      IncomeOrdersManagement();
  Widget _prepareManagementWidget(
          {OrderRecievingType intitalType = OrderRecievingType.Delivery}) =>
      PrepareOrdersManagement(
        orderRecievingType: intitalType,
      );
  Widget _DeliveryOrdersManagementWidget(
          {OrderRecievingType intitalType = OrderRecievingType.Delivery}) =>
      IncomeOrdersManagement();

  void _incomeOrdersOnPressed() => _changeSelectedTab(0);
  void _prepareOrdersOnPressed() => _changeSelectedTab(1);
  void _progressOrdersOnPressed() => _changeSelectedTab(2);

  int _selectedTebIndex = 0;

  Widget get getCurrentPage => _orderStates[_selectedTebIndex].page;
  void _changeSelectedTab(int index) {
    _selectedTebIndex = index;
    emit(ChangeTabIndexState());
  }
}
