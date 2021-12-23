import 'package:flutter/material.dart';
import 'package:store_app/presentation/resourses/styles_manager.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown(
      {Key? key, required this.dropDownItems, required this.onChanged})
      : super(key: key);
  final Set<String> dropDownItems;
  final void Function(String?) onChanged;
  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  late String _selectedItem;

  @override
  void initState() {
    _selectedItem = widget.dropDownItems.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Theme.of(context).primaryColor,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.19,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(5),
        child: DropdownButton<String>(
            isExpanded: true,
            iconEnabledColor: Colors.white,
            borderRadius: BorderRadius.circular(10),
            value: _selectedItem,
            onChanged: (item) {
              setState(() {
                _selectedItem = item!;
              });
              widget.onChanged(item);
            },
            icon: Icon(Icons.keyboard_arrow_down_rounded),
            style: getBoldStyle(fontSize: 16, color: Colors.white),
            underline: Container(),
            isDense: true,
            items: widget.dropDownItems
                .map((e) => DropdownMenuItem(
                      child: FittedBox(child: Text(e)),
                      value: e,
                    ))
                .toList()),
      ),
    );
  }
}
