import 'package:flutter/material.dart';
import 'package:store_app/general_commponent/default_button.dart';
import 'package:store_app/presentation/resourses/styles_manager.dart';
// import 'package:store_app/widgets/orders_view.dart';
import 'package:common_widgets/orders_view.dart';
import 'package:store_app/widgets/shopper_identity.dart';

class IncomeOrdersMonaloaTab extends StatelessWidget {
  const IncomeOrdersMonaloaTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _recievedOrders(height),
        _shopperIdentityColumn(),
        _oderTime(),
        _acceptOrder()
      ],
    );
  }

  Widget _recievedOrders(double height) {
    return Builder(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Recieved orders', style: getBoldStyle(fontSize: 16)),
          OrdersViewList(items: List.generate(2, (index) => 1)),
          Divider()
        ],
      );
    });
  }

  Column _shopperIdentityColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Shopper identity', style: getRegularStyle()),
        ShopperIdentity(),
        Divider(),
      ],
    );
  }

  Widget _oderTime() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Sending time: 12:30AM 15/9/2021', style: getRegularStyle()),
        SizedBox(height: 8),
        Text('Recieving time: 02:30PM 15/9/2021', style: getRegularStyle()),
        SizedBox(height: 8),
      ],
    );
  }

  Widget _acceptOrder() {
    return Builder(builder: (context) {
      return DefaultButton(
        onPressed: () {},
        text: 'Accept order',
        horizontalMargin: MediaQuery.of(context).size.width * 0.27,
      );
    });
  }
}
