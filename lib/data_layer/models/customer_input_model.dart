class CustomerInputModel {
  final String customerName, email;

  CustomerInputModel({
    required this.customerName,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {'name': customerName, 'email': email};
  }
}
