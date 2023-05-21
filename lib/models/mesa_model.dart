import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';

MesasModels mesasModelsFromJson(String str) => MesasModels.fromJson(json.decode(str));

String mesasModelsToJson(MesasModels data) => json.encode(data.toJson());

class MesasModels {
  String id;
  String nombre;
  String descripcion;
  bool estado;
  String imagen;
  int canti;

  MesasModels({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.estado,
    required this.imagen,
    required this.canti,
  });

  factory MesasModels.fromJson(Map<String, dynamic> json) => MesasModels(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        estado: json["estado"],
        imagen: json["imagen"],
        canti: json["imagen"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "descripcion": descripcion,
        "estado": estado,
        "imagen": imagen,
        "canti": canti,
      };
  MesasModels.fromSnapshot(DataSnapshot snapshot)
      : id = snapshot.key!,
        nombre = snapshot.child("nombre").value.toString(),
        descripcion = snapshot.child("descripcion").value.toString(),
        estado = snapshot.child("estado").value as bool,
        imagen = snapshot.child("imagen").value.toString(),
        canti = snapshot.child("canti").value as int;
}
