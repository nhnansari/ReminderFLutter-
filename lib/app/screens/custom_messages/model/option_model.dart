import 'package:flutter/material.dart';

class OptionModel {
  final TextEditingController option; // For user input
  String nature; // The "nature" field from JSON
  bool movesTask; // The "movesTask" field from JSON
  // int taskStageId; // The "taskStageId" field from JSON

  // Constructor to initialize the model
  OptionModel({
    required this.option,
    required this.nature,
    required this.movesTask,
    // required this.taskStageId,
  });

  // Factory constructor to create an instance from JSON
  factory OptionModel.fromJson(Map<String, dynamic> json) {
    return OptionModel(
      option: TextEditingController(text: json['option']),
      nature: json['nature'] ?? '',
      movesTask: json['movesTask'] ?? false,
      // taskStageId: json['taskStageId'] ?? 0,
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'option': option.text, // Use the text value of the controller
      'nature': nature,
      'movesTask': movesTask,
      // 'taskStageId': taskStageId,
    };
  }
}