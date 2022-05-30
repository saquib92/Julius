class GetItemCategory {
  int code;
  List<Item> itemCategoryData;

  GetItemCategory({
    this.code = 0,
    required this.itemCategoryData,
  });
}

class Item {
  String catid;
  String catname;
  String catvalue;
  String catstatus;

  Item({
    this.catid = "",
    this.catname = "",
    this.catvalue = "",
    this.catstatus = "",
  });
}
