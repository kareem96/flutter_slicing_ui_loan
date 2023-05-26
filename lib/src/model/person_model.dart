class PersonModel {
  final int id;
  final String imageUrl;
  final String name;
  final String gender;
  final String job;
  final String email;
  final String telp;

  int value;

  PersonModel( {
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.gender,
    required this.job,
    required this.email,
    required this.telp,
    required this.value
  });
}