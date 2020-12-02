import 'dart:js';

class Ekatalog {

  String namabarang;
  String jumlahbarang;
  String statusbarang;
  int priceeka;
  
//monitoring pengadaan



  Ekatalog({this.namabarang, this.jumlahbarang, this.statusbarang, this.priceeka});


  factory Ekatalog.fromDb(Map<String, dynamic> parsedData){
    return(
      Ekatalog(
        namabarang: parsedData['namabarang'],
        jumlahbarang: parsedData['jumlahbarang'],
        statusbarang : parsedData['statusbarang'],
        priceeka: parsedData['priceeka'],
      ));

  }

  Map<String , dynamic> toMap(){
    return{
      'namabarang' : this.namabarang,
      'jumlahbarang' : this.jumlahbarang,
      'statusbarang' : this.statusbarang,
      'priceeka'  : this.priceeka,

    };
  }

}
