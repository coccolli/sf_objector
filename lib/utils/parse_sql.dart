import 'package:sqlparser/sqlparser.dart';

class SQLParser {
  static const testSql = '''CREATE TABLE ATTRIBUTE_METADATA (
   ATTRIBUTE_NAME VARCHAR2(30) NOT NULL,
   ATTRIBUTE_LOGICAL_NAME VARCHAR2(30) NOT NULL,
   TABLE_METADATA_ID RAW(16) NOT NULL,
   MODULE_METADATA_ID RAW(16) NOT NULL,
   UNIQUE_ID RAW(16) NOT NULL PRIMARY KEY,
   CREATED_DATE DATE NOT NULL,
   LAST_EDITED_DATE DATE,
   CREATED_USER VARCHAR2(50) NOT NULL,
   LAST_EDITED_USER VARCHAR2(50),
   DESCRIPTION VARCHAR2(255),
   COMMENTS VARCHAR2(255),
   FROM_DATE DATE,
   TO_DATE DATE,
   STATUS VARCHAR2(50) DEFAULT 'Unknown',
   PRESERVE_RELATE_IDENTIFIER RAW(16)
);''';

  static parseCreateTable(String createTableStatement) {
    final engine = SqlEngine();
    final result = engine.parse(createTableStatement);
    for (var token in result.tokens) {
      print(token);
    }
  }
}
