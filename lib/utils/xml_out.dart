import 'package:sf_objector/models/custom_object.dart';

class XMLOut {
  static testXml() {
    var co = CustomObject();

    co.label = 'Justification Memorandum';
    co.pluralLabel = 'Justification Memorandums';
    co.nameField =
        NameField('Justification Memorandum Name', 'AutoNumber', 'ETP-{00000}');
    co.externalSharingModel = 'Private';

    print(co.toXML().toXmlString(pretty: true));
  }
}
