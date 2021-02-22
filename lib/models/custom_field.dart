import 'package:xml/xml.dart';

class CustomField {
  String fullName;
  String encryptionScheme;
  bool externalId;
  String label;
  String length;
  bool
      isRequired; //'required' is the correct name but required is a reserved word
  bool trackHistory;
  bool trackTrending;
  String type;
  bool unique;

  XmlElement toXML() {
    var builder = XmlBuilder();
    builder.declaration(version: '1.0', encoding: 'UTF-8');
    builder.element('CustomField',
        attributes: {'xmlns': 'http://soap.sforce.com/2006/04/metadata'},
        nest: () {
      builder
        ..element('label', nest: label)
        ..element('type', nest: type)
        ..element('fullName', nest: fullName)
        ..element('length', nest: length)
        ..element('externalId', nest: externalId)
        ..element('encryptionScheme', nest: encryptionScheme)
        ..element('required', nest: isRequired) //required is a reserved word
        ..element('trackHistory', nest: trackHistory)
        ..element('unique', nest: unique);
    });

    return builder.buildDocument().firstElementChild;
  }
}
