class MedicineModel {
  int? medicineId;
  String? medicationName;
  String? useOfMedications;
  String? contraindicationsForUse;
  String? precautions;
  String? sideEffects;
  String? category;
  List<String>? activeIngredients;
  List<String>? replacements;

  MedicineModel({
    required this.medicineId,
    required this.medicationName,
    required this.useOfMedications,
    required this.contraindicationsForUse,
    required this.precautions,
    required this.sideEffects,
    required this.category,
    required this.activeIngredients,
    required this.replacements,
  });

  MedicineModel.fromJson(Map<String, dynamic> json) {
    medicineId = json['medicineId'];
    medicationName = json['medicationName'];
    useOfMedications = json['useOfMedications'];
    contraindicationsForUse = json['contraindicationsForUse'];
    precautions = json['precautions'];
    sideEffects = json['sideEffects'];
    category = json['category'];
    if (json['activeIngredients'] != null) {
      activeIngredients = [];
      json['activeIngredients'].forEach((v) {
        activeIngredients?.add(v);
      });
    }
    if (json['replacements'] != null) {
      replacements = [];
      json['replacements'].forEach((v) {
        replacements?.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['medicineId'] = medicineId;
    map['medicationName'] = medicationName;
    map['useOfMedications'] = useOfMedications;
    map['precautions'] = precautions;
    map['contraindicationsForUse'] = contraindicationsForUse;
    map['sideEffects'] = sideEffects;
    map['category'] = category;
    if (activeIngredients != null) {
      map['activeIngredients'] = activeIngredients?.map((v) => v).toList();
    }
    if (replacements != null) {
      map['replacements'] = replacements?.map((v) => v).toList();
    }

    return map;
  }

  @override
  List<Object?> get props {
    return [
      medicineId,
      medicationName,
      useOfMedications,
      contraindicationsForUse,
      precautions,
      sideEffects,
      category,
      activeIngredients,
      replacements,
    ];
  }
}
