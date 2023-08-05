class AssociatedModel {
  final int id;
  final String name;
  final String logoImage;
  final String description;
  final String email;
  final String contactNumber;
  final String pix;
  final String street;
  final String descriptionAddr;

  AssociatedModel({
    required this.id,
    required this.name,
    required this.logoImage,
    required this.description,
    required this.email,
    required this.contactNumber,
    required this.pix,
    required this.street,
    required this.descriptionAddr,
  });

  factory AssociatedModel.fromJson(Map<String, dynamic> json) {
    return AssociatedModel(
      id: json['ID'],
      name: json['Asscname'],
      logoImage: json['Logoimage'],
      description: json['Asscdescription'],
      email: json['Email'],
      contactNumber: json['Contactnumber'],
      pix: json['Pix'],
      street: json['Street'],
      descriptionAddr: json['Descriptionaddr'],
    );
  }
}
