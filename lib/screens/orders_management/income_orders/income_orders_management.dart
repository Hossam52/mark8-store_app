import 'package:flutter/material.dart';
import 'package:store_app/screens/orders_management/income_orders/income_delivery.dart';
import 'package:store_app/screens/orders_management/income_orders/income_monaola.dart';
// import 'package:store_app/widgets/delivery_monaola_page.dart';
import 'package:common_widgets/delivery_monaola_page.dart';

class IncomeOrdersManagement extends StatelessWidget {
  IncomeOrdersManagement({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DeliveryMonaolaPage(
        intialSelected: OrderRecievingType.Monaola,
        deliveryWidget: IncomeOrdersDeliveryTab(),
        monaolaWidget: IncomeOrdersMonaloaTab());
  }
}
