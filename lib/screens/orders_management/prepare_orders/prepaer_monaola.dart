import 'package:flutter/material.dart';
import 'package:store_app/general_commponent/components.dart';
import 'package:store_app/general_commponent/default_button.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/presentation/resourses/assets_manager.dart';
import 'package:store_app/presentation/resourses/styles_manager.dart';
import 'package:store_app/screens/orders_management/prepare_orders/prepare_orders_management.dart';
// import 'package:store_app/widgets/image_rounded.dart';
// import 'package:store_app/widgets/orders_view.dart';
import 'package:common_widgets/image_rounded.dart';
import 'package:common_widgets/orders_view.dart';

class PrepareOrdersMonaolaTab extends StatelessWidget {
  const PrepareOrdersMonaolaTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _preparing(height),
          _shopperIdentityColumn(),
          _prepareProducts(),
          _readyRecieving(),
        ],
      ),
    );
  }

  Widget _preparing(double height) {
    return Builder(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('In preparation', style: getRegularStyle()),
          OrdersViewList(items: List.generate(3, (index) => 1)),
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
        _ShopperIdentity(name: 'Fady Al Adoi', id: 2000),
        Divider(),
      ],
    );
  }

  Widget _prepareProducts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Products preparation 1/3', style: getRegularStyle()),
        ...allProducts.map((e) => ProductItem(product: e)),
        Divider()
      ],
    );
  }

  Widget _readyRecieving() {
    return Builder(builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: DefaultButton(
          onPressed: () {},
          text: 'Ready for recieving',
          horizontalMargin: MediaQuery.of(context).size.width * 0.25,
        ),
      );
    });
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
