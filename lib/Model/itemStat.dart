class Item {

//Masih prototype
//Perlu isAccepted, Deskripsi, sellerUid, stock, tanggal
//enum untuk status item

  String name;
  bool jenisPengadaan;
  bool status;
  int price;

  Item({this.name, this.jenisPengadaan, this.status, this.price});

  factory Item.fromDb(Map<String, dynamic> parsedData){
    return(
      Item(
        name: parsedData['name'],
        jenisPengadaan: parsedData['jenisPengadaan'],
        status : parsedData['status'],
        price : parsedData['price'],
      ));
  }

  Map<String , dynamic> toMap(){
    return{
      'name' : this.name,
      'jenisPengadaan' : this.jenisPengadaan,
      'status' : this.status,
      'price' : this.price,

    };
  }

}