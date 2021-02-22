import 'package:sf_objector/utils/parse_sql.dart';
import 'package:sf_objector/utils/xml_out.dart';

void main(List<String> arguments) {
  print('Hello world!');
  XMLOut.testXml();
  SQLParser.parseCreateTable(SQLParser.testSql);
}
