class City {
  City({
    this.id,
    this.imageUrl,
    this.name,
    this.isPopular = false,
  });

  int? id;
  String? name;
  String? imageUrl;
  bool? isPopular;
}

final List<City> popularCities = [
  City(
    id: 1,
    name: 'Jakarta',
    imageUrl: 'assets/city1.png',
  ),
  City(
    id: 2,
    name: 'Bandung',
    imageUrl: 'assets/city2.png',
    isPopular: true,
  ),
  City(
    id: 3,
    name: 'Surabaya',
    imageUrl: 'assets/city3.png',
  ),
  City(
    id: 4,
    name: 'Palembang',
    imageUrl: 'assets/city4.png',
  ),
  City(
    id: 5,
    name: 'Aceh',
    imageUrl: 'assets/city5.png',
    isPopular: true,
  ),
  City(
    id: 6,
    name: 'Bogor',
    imageUrl: 'assets/city6.png',
  ),
];
