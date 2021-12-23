import 'package:common_widgets/confirm_arrival.dart';
import 'package:flutter/material.dart';
import 'package:store_app/general_commponent/components.dart';
import 'package:store_app/presentation/resourses/assets_manager.dart';
import 'package:store_app/presentation/resourses/styles_manager.dart';
import 'package:store_app/screens/orders_management/in_progress_orders/progress_orders_management.dart';
// import 'package:store_app/widgets/image_rounded.dart';
// import 'package:store_app/widgets/orders_view.dart';
import 'package:common_widgets/image_rounded.dart';
import 'package:common_widgets/orders_view.dart';

class ProgressDeliveryTab extends StatelessWidget {
  const ProgressDeliveryTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          _notRecieved(height),
          _shopperIdentityColumn(),
          _confirmArrival(),
          InvoiceInfo()
        ],
      ),
    );
  }

  Widget _notRecieved(double height) {
    return Builder(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Not recieved', style: getRegularStyle()),
          OrdersViewList(items: List.generate(5, (index) => 1)),
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
        _ShopperIdentity(name: 'Fady Samy', id: 134),
        SizedBox(height: 8),
      ],
    );
  }

  Widget _confirmArrival() {
    return Column(
      children: [
        ConfimrArrival(
          arrivalTime: '12:30 AM 15/9/20212',
        ),
        Divider(),
      ],
    );
  }
}

class _ShopperIdentity extends StatelessWidget {
  const _ShopperIdentity({Key? key, required this.name, required this.id})
      : super(key: key);
  final String name;
  final int id;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(children: [
          Expanded(
              flex: 2,
              child: RoundedImage(
                  height: MediaQuery.of(context).size.height * 0.07,
                  imagePath: 'asset/images/store_owner.png')),
          SizedBox(width: 10),
          Expanded(
              flex: 7,
              child: Text('$name  $id',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: getRegularStyle())),
          Expanded(flex: 1, child: buildIcon(ImageAssets.phoneIcon))
        ]),
      ),
    );
  }
}
