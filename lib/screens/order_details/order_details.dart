import 'package:flutter/material.dart';
import 'package:store_app/presentation/resourses/styles_manager.dart';
// import 'package:store_app/general_commponent/components.dart';
// import 'package:store_app/widgets/card_widget.dart';
// import 'package:store_app/widgets/table_data_widget.dart';
import 'package:common_widgets/components.dart';
import 'package:common_widgets/card_widget.dart';
import 'package:common_widgets/table_data_widget.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _appBar(),
        Expanded(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _orderDetailsWidget(),
                _recievingOrderData(),
                _products(),
              ],
            ),
          ),
        ))
      ],
    );
  }

  Widget _appBar() {
    return _CustomAppBar(id: '5441178963');
  }

  Widget _orderDetailsWidget() {
    return Builder(builder: (context) {
      return Row(
        children: [
          BackButton(
            color: Theme.of(context).primaryColor,
          ),
          Expanded(
              child: Center(
            child: Align(
              alignment: Alignment(-0.2, 0),
              child:
                  Text('Order details', style: getRegularStyle(fontSize: 18)),
            ),
          )),
        ],
      );
    });
  }

  Widget _recievingOrderData() {
    final List<TableRowItem> _invoiceData = invoiceData(
      id: '55441123699',
      discount: 5,
      commission: 1,
      totalPrice: 94,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Shopping invoice', style: getSemiBoldStyle(fontSize: 16)),
        TableDataWidget(rows: _invoiceData),
        Divider(),
      ],
    );
  }

  Widget _products() {
    return Builder(builder: (context) {
      final double height = MediaQuery.of(context).size.height;
      final double width = MediaQuery.of(context).size.width;
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Required products',
          style: getRegularStyle(fontSize: 18),
        ),
        SizedBox(
          height: height * 0.21,
          child: ListView.builder(
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => CardWidget(
                    imagePath: 'asset/images/burger.png',
                    title: 'Burger',
                    width: width * 0.31,
                    bottom: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('50 JD', style: getLightStyle(fontSize: 13)),
                        Text('50 JD', style: getLightStyle(fontSize: 13)),
                      ],
                    ),
                  )),
        ),
        SizedBox(height: 5),
        Divider(),
      ]);
    });
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({Key? key, required this.id}) : super(key: key);
  final String id;
  @override
  Widget build(BuildContext context) {
    final double toggleHeight = MediaQuery.of(context).size.height * 0.05;
    final appBar = AppBar(
      leading: Container(),
    );
    final appBarHeight = appBar.preferredSize.height;
    final height = appBarHeight + toggleHeight / 2;
    return Container(
      height: height,
      child: Stack(
        children: [
          SizedBox(height: appBarHeight, child: appBar),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: toggleHeight,
              child: Align(alignment: Alignment.center, child: _idContainer()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _idContainer() {
    final double buttonHeight = 30;
    return Builder(builder: (context) {
      return FittedBox(
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(6)),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          width: MediaQuery.of(context).size.width * 0.25,
          height: buttonHeight,
          child: Center(
            child: FittedBox(
              child: Text(
                id,
                style: getRegularStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      );
    });
  }
}
