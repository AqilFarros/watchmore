part of 'model.dart';

class DetailMovie extends Equatable {
  final int? id;
  final int? runtime;
  final List<ProductionCompany>? productionCompany;

  const DetailMovie({
    this.id,
    this.runtime,
    this.productionCompany,
  });

  factory DetailMovie.fromJson(Map<String, dynamic> data) => DetailMovie(
    id: data["id"],
    runtime: data["runtime"],
    productionCompany: List<ProductionCompany>.from(data["production_companies"].map((x) => ProductionCompany.fromJson(x))),
  );

  @override
  List<Object?> get props => [
        id,
        runtime,
        productionCompany,
      ];
}

class ProductionCompany extends Equatable {
  final int? id;
  final String? name;
  final String? image;

  const ProductionCompany({
    this.id,
    this.name,
    this.image,
  });

  factory ProductionCompany.fromJson(data) =>
      ProductionCompany(
        id: data['id'],
        name: data['name'],
        image: data['logo_path'],
      );

  @override
  List<Object?> get props => [
        id,
        name,
        image,
      ];
}
