class GetScrapPriceListResponse {
  int code;
  List<Rate> rateData;

  GetScrapPriceListResponse({
    this.code = 0,
    required this.rateData,
  });
}

class Rate {
  String itemid;
  String itemname;
  String itemprice;
  String itemcatid;
  String itemdescription;
  String itemimagefile;
  String itemstatus;
  String itemadminid;
  String itemadmintype;
  String itemcreatedatetime;
  String itemupdatedatetime;
  String catid;
  String catname;
  String catvalue;
  String catstatus;

  Rate({
    this.itemid = "",
    this.itemname = "",
    this.itemprice = "",
    this.itemcatid = "",
    this.itemdescription = "",
    this.itemimagefile = "",
    this.itemstatus = "",
    this.itemadminid = "",
    this.itemadmintype = "",
    this.itemcreatedatetime = "",
    this.itemupdatedatetime = "",
    this.catid = "",
    this.catname = "",
    this.catvalue = "",
    this.catstatus = "",
  });
}
