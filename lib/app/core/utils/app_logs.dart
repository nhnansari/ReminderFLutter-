// import 'dart:async';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:aws_cloudwatch/aws_cloudwatch.dart';

// enum LogLevel {
//   debug,
//   info,
//   warn,
//   error,
//   serverError,
//   clientError,
//   success,
// }

// // Convert the enum to a string
// extension LogLevelExtension on LogLevel {
//   String get name {
//     switch (this) {
//       case LogLevel.debug:
//         return 'DEBUG';
//       case LogLevel.info:
//         return 'INFO';
//       case LogLevel.warn:
//         return 'WARN';
//       case LogLevel.error:
//         return 'ERROR';
//       case LogLevel.serverError:
//         return 'SERVER ERROR';
//       case LogLevel.clientError:
//         return 'CLIENT ERROR';
//       case LogLevel.success:
//         return 'SUCCESS';
//       default:
//         return 'ERROR';
//     }
//   }
// }

// Future<CloudWatchHandler> initializeClient() async {
//   // Load the environment variables
//   await dotenv.load(fileName: ".env");

//   // Initialize the CloudWatch client with environment variables
//   final client = CloudWatchHandler(
//     region: dotenv.env["CLOUDWATCH_AWS_REGION"]!,
//     awsAccessKey: dotenv.env["CLOUDWATCH_AWS_ACCESS_KEY"]!,
//     awsSecretKey: dotenv.env["CLOUDWATCH_AWS_SECRET_KEY"]!,
//   );

//   return client;
// }

// Future<void> logToCloudWatch(CloudWatchHandler client, String logGroupName,
//     String logStreamName, String message) async {
//   if (logGroupName.isEmpty) {
//     throw ArgumentError('Log group name cannot be null or empty');
//   }
//   if (logStreamName.isEmpty) {
//     throw ArgumentError('Log stream name cannot be null or empty');
//   }
//   if (message.isEmpty) {
//     throw ArgumentError('Message cannot be null or empty');
//   }

//   try {
//     CloudWatch? instance;

//     // Check if the instance for the log group and stream already exists
//     instance = client.getInstance(
//       logGroupName: logGroupName,
//       logStreamName: logStreamName,
//     );

//     // If instance doesn't exist, create one
//     instance ??=  client.createInstance(
//       logGroupName: logGroupName,
//       logStreamName: logStreamName,
//     );

//     // Log the message to the CloudWatch instance
//     await instance.log(message);
//   } catch (e) {
//     if (kDebugMode) {
//       print('Error checking/creating log group or stream: $e');
//     }
//     rethrow;
//   }
// }

// Future<void> log(String message, {LogLevel level = LogLevel.info}) async {
//   if (message.isEmpty) {
//     throw ArgumentError('Message cannot be null or empty');
//   }
 
//   // Load the environment variables
//   await dotenv.load(fileName: ".env");                  

//   final logGroupName = dotenv.env['CLOUDWATCH_AWS_LOG_GROUP'];
//   if (logGroupName == null || logGroupName.isEmpty) {
//     throw ArgumentError('Log group name is not set in the environment variables');
//   }

//   // Use the level name as the log stream name
//   final logStreamName = level.name;

//   // Initialize the CloudWatch client
//   final client = await initializeClient();

//   // Log the message to CloudWatch
//   try {
//     await logToCloudWatch(client, logGroupName, logStreamName, message);
//   } catch (e) {
//     if (kDebugMode) {
//       print('Error logging message: $e');
//     }
//   }
// }
