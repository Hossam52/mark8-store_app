import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/presentation/resourses/color_manager.dart';
import 'package:store_app/presentation/resourses/styles_manager.dart';
import 'package:store_app/screens/orders_management/prepare_orders/prepaer_monaola.dart';
import 'package:store_app/screens/orders_management/prepare_orders/prepare_delivery.dart';
// import 'package:store_app/widgets/delivery_monaola_page.dart';
import 'package:common_widgets/delivery_monaola_page.dart';

class PrepareOrdersManagement extends StatelessWidget {
  const PrepareOrdersManagement(
      {Key? key, this.orderRecievingType = OrderRecievingType.Delivery})
      : super(key: key);
  final OrderRecievingType orderRecievingType;
  @override
  Widget build(BuildContext context) {
    return DeliveryMonaolaPage(
      deliveryWidget: PrepareOrdersDeliveryTab(),
      monaolaWidget: PrepareOrdersMonaolaTab(),
      intialSelected: orderRecievingType,
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key, required this.product}) : super(key: key);
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.13,
      width: double.infinity,
      child: Card(
        elevation: 0,
        child: Row(
          children: [
            Expanded(child: _productImage()),
            Expanded(child: _nameAndPrice()),
            Spacer(),
            _quantityAndWeight(),
          ],
        ),
      ),
    );
  }

  Widget _productImage() {
    return Image.asset(product.imagePath, fit: BoxFit.fill);
  }

  Widget _nameAndPrice() {
    return Builder(builder: (context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(product.name, style: getRegularStyle()),
          Text('Measure', style: getRegularStyle(color: ColorManager.grey)),
          Text('${product.price} JD',
              style: getRegularStyle(
                  color: Theme.of(context).colorScheme.secondary))
        ],
      );
    });
  }

  Widget _quantityAndWeight() {
    return Builder(builder: (context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _richText('Quantity', '${product.quantitiy}'),
          _richText('Weight', '${product.weight}'),
          _productStatus(product.isPrepared ? 'Prepared' : 'Preparing',
              color: product.isPrepared
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).colorScheme.secondary),
        ],
      );
    });
  }

  Widget _richText(String title, String value) {
    return RichText(
      text: TextSpan(
        text: '$title  ',
        style: getRegularStyle(color: ColorManager.grey),
        children: [
          TextSpan(
            text: value,
            style: getRegularStyle(),
          ),
        ],
      ),
    );
  }

  Widget _productStatus(String text, {Color? color}) {
    return Builder(builder: (context) {
      return Container(
        width: MediaQuery.of(context).size.width * 0.23,
        decoration: BoxDecoration(
          color: color ?? Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Center(
            child: Text(
              text,
              style: getRegularStyle(color: Colors.white),
            ),
          ),
        ),
      );
    });
  }
}
