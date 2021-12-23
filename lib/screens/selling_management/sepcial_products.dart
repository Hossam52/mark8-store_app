import 'package:common_widgets/build_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/general_commponent/components.dart';
// import 'package:store_app/general_commponent/default_button.dart';
import 'package:common_widgets/default_button.dart';
import 'package:store_app/models/driver_model.dart';
import 'package:store_app/presentation/resourses/assets_manager.dart';
import 'package:store_app/presentation/resourses/color_manager.dart';
import 'package:store_app/presentation/resourses/styles_manager.dart';
import 'package:store_app/screens/profiles/driver_profile/driver_profile_management.dart';
// import 'package:store_app/widgets/cancel_Item.dart';
// import 'package:store_app/widgets/custom_toggle_buttons.dart';
// import 'package:store_app/widgets/image_rounded.dart';
import 'package:common_widgets/cancel_Item.dart';
import 'package:common_widgets/custom_toggle_buttons.dart';
import 'package:common_widgets/image_rounded.dart';

class SpecialProducts extends StatelessWidget {
  const SpecialProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _specialProducts(),
          _productivity(),
          _specialMarkets(),
          _specialDrivers(),
          _bestOffer(),
          _saveChanges(),
        ],
      ),
    );
  }

  Widget _specialProducts() {
    return Builder(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Special products',
            style: getRegularStyle(),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.17,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (_, index) => _ProductItem(
                      selected: index == 1,
                    )),
          ),
          Divider(),
        ],
      );
    });
  }

  Widget _productivity() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Avilablity',
          style: getRegularStyle(),
        ),
        Row(
          children: [
            Text('Selling only', style: getRegularStyle()),
            SizedBox(width: 8),
            CustomToggleButtons(
              tabs: [
                ToggleItemData(title: 'Delivery', onPressed: () {}),
                ToggleItemData(title: 'Monaloa', onPressed: () {}),
              ],
            )
          ],
        ),
        SizedBox(height: 4),
        Divider()
      ],
    );
  }

  Widget _specialMarkets() {
    return Builder(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Special Markets',
            style: getRegularStyle(),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.18,
            child: ListView.builder(
                padding: const EdgeInsets.all(5),
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (_, index) => _MarketItem(
                      selected: index == 1,
                    )),
          ),
        ],
      );
    });
  }

  Widget _specialDrivers() {
    return Builder(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Special drivers',
            style: getRegularStyle(),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.21,
            child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8),
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (_, index) => _DriverItem(
                      selected: index == 1,
                    )),
          ),
          Divider()
        ],
      );
    });
  }

  Widget _bestOffer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Choose best selling offer',
          style: getRegularStyle(),
        ),
        SizedBox(height: 10.h),
        Wrap(
          direction: Axis.horizontal,
          spacing: 8.w,
          children: [
            _OfferItem(text: 'Discount 70%'),
            _OfferItem(text: '3x1'),
            _OfferItem(text: 'Discount 20%'),
          ],
        ),
        SizedBox(height: 8),
      ],
    );
  }

  Widget _saveChanges() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DefaultButton(
        onPressed: () {},
        text: 'Save changes',
        horizontalMargin: 70.w,
      ),
    );
  }
}

class _ProductItem extends StatelessWidget {
  const _ProductItem({Key? key, this.selected = false}) : super(key: key);
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: !selected
                ? null
                : Border.all(
                    color: Theme.of(context).colorScheme.secondary,
                  )),
        width: MediaQuery.of(context).size.width * 0.28,
        height: double.infinity,
        child: Column(
          children: [
            Expanded(
                flex: 4,
                child: RoundedImage(imagePath: 'asset/images/product.png')),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Shoes',
                    style: getRegularStyle(),
                  ),
                  Text(
                    '50 J.D',
                    style: getRegularStyle(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _MarketItem extends StatelessWidget {
  const _MarketItem({Key? key, this.selected = false}) : super(key: key);
  final bool selected;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width * 0.21;
    return UnconstrainedBox(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child:
            selected ? _selected(context, width) : _notSelected(context, width),
      ),
    );
  }

  Widget _selected(BuildContext context, double width) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).colorScheme.secondary,
                  blurRadius: 5),
            ],
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          width: width,
          height: MediaQuery.of(context).size.height * 0.16,
          child: Column(
            children: [
              Expanded(flex: 4, child: _imageAndName()),
              Expanded(
                  child: FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BuildIcon(path: ImageAssets.verified),
                    Text(
                      'Delivery',
                      style: getRegularStyle(
                        color: ColorManager.grey,
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
        CancelItem(),
      ],
    );
  }

  Widget _notSelected(BuildContext context, double width) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        width: width,
        height: MediaQuery.of(context).size.height * 0.13,
        child: _imageAndName());
  }

  Widget _imageAndName() {
    return Column(
      children: [
        Expanded(
            flex: 4,
            child: RoundedImage(imagePath: 'asset/images/product.png')),
        Expanded(
          child: Text('Al salt', style: getRegularStyle()),
        ),
      ],
    );
  }
}

class _DriverItem extends StatelessWidget {
  const _DriverItem({Key? key, this.selected = false}) : super(key: key);
  final bool selected;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width * 0.26;
    return InkWell(
      onTap: () => To(
        context,
        DriverProfileManagement(
          DriverScreenConfigs(
            driverProfile,
            bottomButton: DefaultButton(
              onPressed: () {
                Navigator.pop(context);
              },
              text: 'Choose',
            ),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child:
            selected ? _selected(context, width) : _notSelected(context, width),
      ),
    );
  }

  Widget _selected(BuildContext context, double width) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Theme.of(context).colorScheme.secondary,
                    blurRadius: 5),
              ],
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            width: width,
            height: double.infinity,
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: _imageAndName(),
                ),
              ],
            ),
          ),
        ),
        BuildIcon(path: ImageAssets.verified),
      ],
    );
  }

  Widget _notSelected(BuildContext context, double width) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        width: width,
        height: double.infinity,
        child: _imageAndName());
  }

  Widget _imageAndName() {
    return Column(
      children: [
        Expanded(
            flex: 2,
            child: RoundedImage(imagePath: 'asset/images/product.png')),
        Expanded(
          child: FittedBox(
            child: Column(
              children: [
                Text('Al salt', style: getRegularStyle()),
                Text('1KM/1J.D', style: getRegularStyle()),
                Text('Cairo', style: getRegularStyle()),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _OfferItem extends StatelessWidget {
  const _OfferItem({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(5)),
      constraints: BoxConstraints(
        minWidth: MediaQuery.of(context).size.width * 0.25,
        minHeight: MediaQuery.of(context).size.height * 0.03,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: getRegularStyle(color: Colors.white),
      ),
    );
  }
}
