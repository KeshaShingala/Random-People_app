class PersonData {

  final String name;
  final String email;
  final String photo;
  final String number;
  final String bod;
  final int age;
  final String gender;
  final String location;

  PersonData(
      {
        required this.name,
        required this.email,
        required this.photo,
        required this.number,
        required this.bod,
        required this.age,
        required this.gender,
        required this.location});

  factory PersonData.fromMap({required Map e}) {
    return PersonData(
        name:
        "${e["results"][0]["name"]["title"]} ${e["results"][0]["name"]["first"]}",
        email: e["results"][0]["email"],
        photo: e["results"][0]["picture"]["large"],
        number: e["results"][0]["phone"],
        bod: e["results"][0]["dob"]["date"],
        age: e["results"][0]["dob"]["age"],
        gender: e["results"][0]["gender"],
        location:
        "${e["results"][0]["location"]["street"]["number"]}, "
            "${e["results"][0]["location"]["street"]["name"]}, "
            "${e["results"][0]["location"]["city"]}\n"
            "${e["results"][0]["location"]["state"]}, "
            "${e["results"][0]["location"]["country"]},");
  }
}