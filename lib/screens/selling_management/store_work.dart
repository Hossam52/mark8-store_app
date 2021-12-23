import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
// import 'package:store_app/general_commponent/default_button.dart';
import 'package:common_widgets/default_button.dart';
import 'package:store_app/presentation/resourses/styles_manager.dart';
import 'package:store_app/widgets/custom_drop_down.dart';
// import 'package:store_app/widgets/custom_toggle_buttons.dart';
// import 'package:store_app/widgets/image_rounded.dart';
import 'package:common_widgets/custom_toggle_buttons.dart';
import 'package:common_widgets/image_rounded.dart';

class StoreWork extends StatelessWidget {
  const StoreWork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _storeOpenning(),
            _sellingType(),
            _recievingOrdersType(),
            _deliveryCompanies(),
          ],
        ),
      ),
    );
  }

  Widget _storeOpenning() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Store openning',
              style: getRegularStyle(),
            ),
            SizedBox(width: 15),
            CustomToggleButtons(
              tabs: [
                ToggleItemData(title: 'Open', onPressed: () {}),
                ToggleItemData(title: 'Closed', onPressed: () {}),
              ],
            )
          ],
        ),
        SizedBox(height: 8),
        Divider()
      ],
    );
  }

  Widget _sellingType() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            'Selling type',
            style: getRegularStyle(),
          ),
          SizedBox(width: 15),
          CustomToggleButtons(
            tabs: [
              ToggleItemData(title: 'One store', onPressed: () {}),
              ToggleItemData(title: 'Multiple store', onPressed: () {}),
              ToggleItemData(title: 'Both', onPressed: () {}),
            ],
          )
        ],
      ),
    );
  }

  Widget _recievingOrdersType() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Recieving order type', style: getRegularStyle()),
        SizedBox(height: 8),
        CustomToggleButtons(
          tabs: [
            ToggleItemData(title: 'Delivery', onPressed: () {}),
            ToggleItemData(title: 'Monaola', onPressed: () {}),
          ],
        ),
        SizedBox(height: 8),
        _DateBuilder(),
        _openningTimeSelection(),
        SizedBox(height: 8),
        Divider(),
      ],
    );
  }

  Widget _openningTimeSelection() {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Row(
            children: [
              Text('From', style: getRegularStyle()),
              SizedBox(width: 8),
              Expanded(
                child: CustomDropDown(
                  dropDownItems: {
                    '11:00 am',
                    '12:00 am',
                    '01:00 am',
                    '02:00 am',
                    '03:00 am',
                  },
                  onChanged: (_) {},
                ),
              ),
              SizedBox(width: 8),
              Text('To', style: getRegularStyle()),
              SizedBox(width: 8),
              Expanded(
                child: CustomDropDown(
                  dropDownItems: {
                    '11:00 am',
                    '12:00 am',
                    '01:00 am',
                    '02:00 am',
                    '03:00 am',
                  },
                  onChanged: (_) {},
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        Builder(builder: (context) {
          return Expanded(
            flex: 3,
            child: Center(
              child: DefaultButton(
                  onPressed: () {},
                  text: 'Save',
                  background: Theme.of(context).colorScheme.secondary),
            ),
          );
        })
      ],
    );
  }

  Widget _deliveryCompanies() {
    return Builder(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Delivery Comapnies', style: getRegularStyle()),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.18,
            child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8),
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) => _DeliveryComapnyItem(
                      imagePath: 'asset/images/delivery_image.png',
                      name: 'Dlivery',
                      driversCount: 13,
                      isSelected: index == 1,
                    )),
          )
        ],
      );
    });
  }
}

class _DateBuilder extends StatefulWidget {
  _DateBuilder({Key? key}) : super(key: key);

  @override
  State<_DateBuilder> createState() => _DateBuilderState();
}

class _DateBuilderState extends State<_DateBuilder> {
  final List<DateTime> weekDays = [];
  int _selectedDateIndex = 0;
  @override
  void initState() {
    fillweekDaysInMonth();
    super.initState();
  }

  void fillweekDaysInMonth() {
    weekDays.addAll(
      List.generate(
        7,
        (index) => DateTime.now().add(
          Duration(days: index),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Card(
      elevation: 0,
      child: SizedBox(
        height: height * 0.14,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: weekDays.length,
          itemBuilder: (_, index) => InkWell(
            onTap: () {
              setState(() {
                _selectedDateIndex = index;
              });
            },
            child: _DateItem(
              date: weekDays[index],
              selected: _selectedDateIndex == index,
            ),
          ),
        ),
      ),
    );
  }
}

class _DateItem extends StatelessWidget {
  const _DateItem({Key? key, required this.date, this.selected = false})
      : super(key: key);
  final DateTime date;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    final dayName = intl.DateFormat('EEE').format(date);
    final dayNumber = intl.DateFormat('dd').format(date);
    final double width = MediaQuery.of(context).size.width;
    final fontColor = !selected ? Colors.black : Colors.white;
    return Container(
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.all(4),
      width: width * 0.11,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color:
            selected ? Theme.of(context).colorScheme.secondary : Colors.white,
      ),
      child: Column(
        children: [
          Expanded(
            child: FittedBox(
              child: Text(
                dayName,
                style: getRegularStyle(fontSize: 19, color: fontColor),
              ),
            ),
          ),
          Expanded(
            child: Text(
              dayNumber,
              style: getRegularStyle(fontSize: 19, color: fontColor),
            ),
          ),
          Spacer(),
          if (_isToday())
            Expanded(
              child: FittedBox(
                child: Text(
                  'Today',
                  style: getRegularStyle(fontSize: 19, color: fontColor),
                ),
              ),
            ),
        ],
      ),
    );
  }

  bool _isToday() {
    final DateTime now = DateTime.now();
    return date.day == now.day &&
        date.year == now.year &&
        date.month == now.month;
  }
}

class _DeliveryComapnyItem extends StatelessWidget {
  const _DeliveryComapnyItem(
      {Key? key,
      required this.imagePath,
      required this.name,
      required this.driversCount,
      required this.isSelected})
      : super(key: key);
  final String imagePath;
  final String name;
  final int driversCount;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.21,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: !isSelected ? [] : _shadows(context)),
      child: Column(
        children: [
          Expanded(flex: 4, child: _comapnyImage()),
          Expanded(child: FittedBox(child: _comapnyName())),
          Expanded(child: FittedBox(child: _comapnyDriviers())),
        ],
      ),
    );
  }

  List<BoxShadow> _shadows(context) {
    return [
      BoxShadow(
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.6),
          blurRadius: 10),
    ];
  }

  Widget _comapnyImage() => RoundedImage(
        imagePath: imagePath,
        width: double.infinity,
        height: double.infinity,
        radius: 25,
      );

  Widget _comapnyName() {
    return Text(name, style: getRegularStyle());
  }

  Widget _comapnyDriviers() {
    return Builder(builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Text('$driversCount Driver',
            style: getRegularStyle(
              color: Theme.of(context).colorScheme.secondary,
            )),
      );
    });
  }
}
