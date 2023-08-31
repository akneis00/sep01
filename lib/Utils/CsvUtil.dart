import 'package:csv/csv.dart';

class CsvUtil {
  List<List> getTable(String input){
    return const CsvToListConverter().convert(input, eol: '\n');
  }
}