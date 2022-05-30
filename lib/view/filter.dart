import 'package:flutter/material.dart';
import 'package:kabadonline/models/generate_token.dart';
import 'package:kabadonline/models/item_category_response.dart';
import 'package:kabadonline/provider/api_provider.dart';

class FilterItem extends StatefulWidget {
  final Function applyFilter;
  const FilterItem({Key? key, required this.applyFilter}) : super(key: key);

  @override
  State<FilterItem> createState() => _FilterItemState();
}

class _FilterItemState extends State<FilterItem> {
  List<Item> FilterItemList = [];
  var selectedRadioButton = "";
  var isLoading = true;

  void itemcategoryList() async {
    setState(() {
      isLoading = true;
    });
    var token = await ApiProvider.getTokenapiCall(GenerateTokenRequest());
    var response = await ApiProvider.getFilterItemCat(token);
    setState(() {
      isLoading = false;
      FilterItemList = response.itemCategoryData;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero).then((value) {
      itemcategoryList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        TextButton(
          child: Text(
            "Reset",
            style: TextStyle(
              color: Colors.red,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
            widget.applyFilter(
              itemId: selectedRadioButton,
              resetFilters: true,
            );
          },
        ),
        TextButton(
          child: Text("Apply"),
          onPressed: () {
            Navigator.of(context).pop();
            widget.applyFilter(itemId: selectedRadioButton);
          },
        ),
      ],
      content: Column(
        children: [
          Text(
            "Filter",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          if (isLoading)
            Center(
              child: CircularProgressIndicator(),
            )
          else
            Expanded(
              child: SizedBox(
                width: double.maxFinite,
                child: ListView.builder(
                  itemCount: FilterItemList.length,
                  itemBuilder: (ctx, i) => Row(
                    children: [
                      Radio(
                        value: FilterItemList[i].catid,
                        groupValue: selectedRadioButton,
                        onChanged: (val) {
                          setState(() {
                            selectedRadioButton = val as String;
                          });
                        },
                      ),
                      Text(FilterItemList[i].catname),
                    ],
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
