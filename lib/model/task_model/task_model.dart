class TaskModel{
  String? uplodedBy;
  String? uplodedOn;
  String? deadLine;
  String? title;
  String? description;
  String? specialty;
  String? uId;


  TaskModel({
    this.uplodedBy,
    this.uplodedOn,
    this.deadLine,
    this.specialty,
    this.title,
    this.description,
    this.uId,
  });


  TaskModel.fromJson( Map<String , dynamic>? json ){
    uplodedBy = json!['uplodedBy'];
    uplodedOn = json['uplodedOn'];
    deadLine = json['deadLine'];
    specialty = json['specialty'];
    uId = json['uId'];
    title = json['title'];
    description = json['description'];
  }

  Map<String , dynamic>  toMap() {
    return {
      'uplodedBy' : uplodedBy,
      'uplodedOn' :uplodedOn,
      'deadLine' :deadLine,
      'specialty' :specialty,
      'uId' :uId,
      'title' :title,
      'description' :description,
    };
  }

}