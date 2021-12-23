import 'package:common_widgets/recieving_table.dart';
import 'package:flutter/material.dart';
// import 'package:store_app/general_commponent/components.dart';
import 'package:store_app/presentation/resourses/assets_manager.dart';
import 'package:store_app/presentation/resourses/styles_manager.dart';
import 'package:store_app/screens/orders_management/in_progress_orders/progress_delivery.dart';
import 'package:store_app/screens/orders_management/in_progress_orders/progress_monaola.dart';
import 'package:common_widgets/delivery_monaola_page.dart';
// import 'package:store_app/general_commponent/default_button.dart';
import 'package:common_widgets/default_button.dart';
import 'package:common_widgets/signature.dart';
import 'package:common_widgets/table_data_widget.dart';
import 'package:common_widgets/components.dart';

class ProgressOrdersManagement extends StatelessWidget {
  const ProgressOrdersManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DeliveryMonaolaPage(
      deliveryWidget: ProgressDeliveryTab(),
      monaolaWidget: ProgressMonaolaTab(),
    );
  }
}

class InvoiceInfo extends StatelessWidget {
  InvoiceInfo({Key? key}) : super(key: key);
  final _invoiceData = invoiceData(
    id: '5544123699',
    discount: 5,
    commission: 1,
    totalPrice: 94,
  );

  @override
  Widget build(BuildContext context) {
    return RecievingTableWidget(
        time: '12:30 AM 15/9/2021',
        tableData: _invoiceData,
        onPayInvoicePressed: () {},
        onConfirmPressed: () => _confirmPurchase(context));
  }

  void _confirmPurchase(context) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        child: _FinishDialog(),
      ),
    );
  }
}

class _FinishDialog extends StatelessWidget {
  const _FinishDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10),
          Image.asset(
            ImageAssets.success,
          ),
          SizedBox(height: 10),
          Text('Congratulations!!',
              style: getLightStyle(
                  color: Theme.of(context).primaryColor, fontSize: 18)),
          SizedBox(height: 10),
          Text('Done finishing the tour.',
              textAlign: TextAlign.center,
              style: getRegularStyle(fontSize: 20)),
          SizedBox(height: 15),
          Text('12:30 AM 15/9/2021',
              style: getRegularStyle(
                  color: Theme.of(context).primaryColor, fontSize: 15)),
          SizedBox(height: 15),
          _facingProble(context)
        ],
      ),
    );
  }

  Widget _facingProble(BuildContext context) {
    return Wrap(children: [
      Text('Did you encounter a problem? ', style: getRegularStyle()),
      Text('press ', style: getRegularStyle()),
      InkWell(
        onTap: () {},
        child: Text('help ',
            style: getRegularStyle(color: Theme.of(context).primaryColor)),
      )
    ]);
  }
}
