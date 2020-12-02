class Item {

//Masih prototype
//Perlu isAccepted, Deskripsi, sellerUid, stock, tanggal
//enum untuk status item

  String usulan;
  String jenisPengadaan;
  String status;
  
//monitoring pengadaan



  Item({this.usulan, this.jenisPengadaan, this.status,});


  factory Item.fromDb(Map<String, dynamic> parsedData){
    return(
      Item(
        usulan: parsedData['usulan'],
        jenisPengadaan: parsedData['jenisPengadaan'],
        status : parsedData['status'],
      ));

  }

  Map<String , dynamic> toMap(){
    return{
      'usulan' : this.usulan,
      'jenisPengadaan' : this.jenisPengadaan,
      'status' : this.status,

    };
  }

}