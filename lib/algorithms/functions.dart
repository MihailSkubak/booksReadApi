///Convert data from Api for all books and get information title
List<List<String>> getDataBooks(List<dynamic> dataValue) {
  if (dataValue.isNotEmpty) {
    List<dynamic> value = [];
    List<dynamic> abbrev = [];
    List<String> valueItems = [];
    List<List<String>> valueReturn = [];
    for (int inx = 0; inx < dataValue.length; inx++) {
      value = dataValue[inx].values.toList();
      abbrev = value[0].values.toList();
      valueItems = [];
      //get first element from value Map
      valueItems.add(abbrev[0].toString());
      //get another elements
      for (int i = 1; i < value.length; i++) {
        valueItems.add(value[i].toString());
      }
      valueReturn.add(valueItems);
    }
    return valueReturn;
  } else {
    return [];
  }
}

///get comment from book (dashboard with summary information)
String getDataBook(Map<String, dynamic> dataValue) {
  String value = '';
  if (dataValue.isNotEmpty) {
    value = dataValue['comment'];
  }
  return value;
}
