import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:store_app/general_commponent/components.dart';
// import 'package:store_app/general_commponent/default_button.dart';
import 'package:common_widgets/default_button.dart';
import 'package:store_app/presentation/resourses/assets_manager.dart';
import 'package:store_app/presentation/resourses/styles_manager.dart';
// import 'package:store_app/widgets/counter_buttons.dart';
// import 'package:store_app/widgets/custom_toggle_buttons.dart';
import 'package:common_widgets/build_icon.dart';
import 'package:common_widgets/counter_buttons.dart';
import 'package:common_widgets/custom_toggle_buttons.dart';
import 'package:common_widgets/default_text_form_field.dart';

class StyleProducts extends StatelessWidget {
  const StyleProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _mainDepartment(),
          _subsectionDepartment(),
          _images(),
          _products(),
          _details(),
        ],
      ),
    );
  }

  Widget _mainDepartment() {
    final List<bool> selected = List.generate(15, (_) => false);
    selected.first = true;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Main department',
          style: getRegularStyle(),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Center(
            child: Wrap(
              runAlignment: WrapAlignment.start,
              spacing: 10,
              children: [
                for (int i = 0; i < selected.length; i++)
                  _BadgeItem(
                    name: 'Foods',
                    count: Random().nextInt(30),
                    isSelected: selected[i],
                  ),
              ],
            ),
          ),
        ),
        Divider(),
      ],
    );
  }

  Widget _subsectionDepartment() {
    final List<bool> selected = List.generate(15, (_) => false);
    selected.first = true;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Subsection department',
          style: getRegularStyle(),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Center(
            child: Wrap(
              runAlignment: WrapAlignment.start,
              spacing: 10,
              children: [
                for (int i = 0; i < selected.length; i++)
                  _BadgeItem(
                    name: 'Fast food',
                    count: Random().nextInt(30),
                    isSelected: selected[i],
                  ),
              ],
            ),
          ),
        ),
        Divider(),
      ],
    );
  }

  Widget _images() {
    return Builder(builder: (context) {
      return Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.1,
        child: Row(
          children: [
            _addImage(),
            VerticalDivider(color: Theme.of(context).primaryColor),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (_, index) => _ProductImage(
                    imagePath: 'asset/images/product_image.png',
                    selected: index == 0),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _addImage() {
    return Builder(builder: (context) {
      return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(10),
        ),
        width: MediaQuery.of(context).size.width * 0.16,
        child: FittedBox(
          child: Icon(Icons.add, color: Colors.white),
        ),
      );
    });
  }

  Widget _products() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Products', style: getRegularStyle()),
          Row(
            children: [
              Expanded(flex: 2, child: _priceAndWeight()),
              Expanded(child: _ProductPreview()),
            ],
          ),
          SizedBox(height: 8),
          _sizesManagement(),
        ],
      ),
    );
  }

  Widget _priceAndWeight() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _counterItem('Price', 'J.D', (_) {}),
        SizedBox(height: 8),
        _counterItem('Weight', 'KG', (_) {}),
      ],
    );
  }

  Widget _counterItem(
      String title, String measureUnit, void Function(int) onCounterChange) {
    return Builder(builder: (context) {
      return Row(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.12,
              child: Text('$title', style: getRegularStyle())),
          SizedBox(width: 8),
          CounterButtons(onCounterChange: onCounterChange),
          SizedBox(width: 8),
          Text('$measureUnit', style: getRegularStyle())
        ],
      );
    });
  }

  Widget _sizesManagement() {
    final List<ToggleItemData> colors = [
      ToggleItemData(title: 'Black', onPressed: () {}),
      ToggleItemData(title: 'Red', onPressed: () {}),
      ToggleItemData(title: 'Purple', onPressed: () {}),
    ];
    final List<ToggleItemData> sizes = [
      ToggleItemData(title: 'Large', onPressed: () {}),
      ToggleItemData(title: 'Medium', onPressed: () {}),
      ToggleItemData(title: 'Small', onPressed: () {}),
    ];
    return Builder(builder: (context) {
      return Row(
        children: [
          Expanded(
            child: Text(
              'Define sizes',
              style: getRegularStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                _toggelsButtons(colors, () {}),
                _toggelsButtons(sizes, () {}),
              ],
            ),
          )
        ],
      );
    });
  }

  Widget _toggelsButtons(
      List<ToggleItemData> items, VoidCallback onAddPressed) {
    return Builder(builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            Expanded(
                child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: CustomToggleButtons(
                  minWidth: 70.w,
                  backgroundColor: Color(0xfff5f5f5),
                  tabs: items),
            )),
            SizedBox(width: 10),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle,
              ),
              child: GestureDetector(
                onTap: onAddPressed,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      );
    });
  }

  Widget _details() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Store description',
          style: getRegularStyle(),
        ),
        Row(
          children: [
            Expanded(
              child: _storeDiscriptionTextField(),
            ),
            Expanded(
              child: _quantityAndSave(),
            )
          ],
        )
      ],
    );
  }

  Widget _storeDiscriptionTextField() {
    return DefaultTextFormField(
      controller: TextEditingController(),
      hint: '',
      maxLines: 4,
    );
  }

  Widget _quantityAndSave() {
    return Builder(builder: (context) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Quantity', style: getRegularStyle()),
              SizedBox(width: 8),
              CounterButtons(onCounterChange: (_) {}),
            ],
          ),
          SizedBox(height: 8),
          DefaultButton(
            onPressed: () {},
            text: 'Save changes',
            background: Theme.of(context).colorScheme.secondary,
            horizontalMargin: 0,
          )
        ],
      );
    });
  }
}

class _BadgeItem extends StatelessWidget {
  const _BadgeItem(
      {Key? key,
      required this.name,
      required this.count,
      required this.isSelected})
      : super(key: key);
  final String name;
  final int count;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        _itemContent(context),
        _counter(),
      ],
    );
  }

  Widget _itemContent(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0),
      constraints:
          BoxConstraints(minWidth: MediaQuery.of(context).size.width * 0.23),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color:
            isSelected ? Theme.of(context).colorScheme.secondary : Colors.white,
        border: Border.all(width: 0.5),
      ),
      padding: const EdgeInsets.all(4),
      child: Center(
        child: Text(
          '$name',
          style:
              getRegularStyle(color: isSelected ? Colors.white : Colors.black),
        ),
      ),
    );
  }

  Widget _counter() {
    return CircleAvatar(
      radius: 8,
      child: FittedBox(
          child: Text(
        '$count',
        style: getRegularStyle(color: Colors.white),
      )),
      backgroundColor: Colors.red,
    );
  }
}

class _ProductImage extends StatelessWidget {
  const _ProductImage(
      {Key? key, required this.imagePath, this.selected = false})
      : super(key: key);
  final String imagePath;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      width: MediaQuery.of(context).size.width * 0.16,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: !selected
              ? null
              : Border.all(color: Theme.of(context).colorScheme.secondary),
          image:
              DecorationImage(image: AssetImage(imagePath), fit: BoxFit.fill)),
    );
  }
}

class _ProductPreview extends StatelessWidget {
  const _ProductPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.19,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 3,
              child: Image.asset('asset/images/product_image.png',
                  fit: BoxFit.fill)),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BuildIcon(path: ImageAssets.edit),
                SizedBox(width: 2),
                Text(
                  'Product name',
                  style: getRegularStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          Expanded(
            child: DefaultButton(
              text: 'Special',
              background: Theme.of(context).colorScheme.secondary,
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
