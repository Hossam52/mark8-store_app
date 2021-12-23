import 'package:common_widgets/image_rounded.dart';
import 'package:flutter/material.dart';
import 'package:store_app/general_commponent/components.dart';
import 'package:store_app/general_commponent/default_button.dart';
import 'package:store_app/presentation/resourses/styles_manager.dart';
import 'package:store_app/screens/order_details/order_details_management.dart';

class ShopperIdentity extends StatelessWidget {
  const ShopperIdentity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        To(context, OrderDetailsManagement());
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(children: [
            Expanded(
                child: RoundedImage(
                    height: MediaQuery.of(context).size.height * 0.07,
                    imagePath: 'asset/images/store_owner.png')),
            SizedBox(width: 10),
            Expanded(
                flex: 3,
                child: Text('Mohamed Hassan  134',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: getRegularStyle())),
            Expanded(
              flex: 3,
              child: DefaultButton(
                horizontalMargin: 10,
                onPressed: () {
                  To(context, OrderDetailsManagement(index: 1));
                },
                text: 'Order details',
                background: Theme.of(context).colorScheme.secondary,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
