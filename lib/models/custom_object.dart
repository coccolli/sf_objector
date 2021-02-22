import 'package:xml/xml.dart';

class CustomObject {
  String allowInChatterGroups;
  bool enableActivities = false;
  bool enableBulkApi = true;
  String compactLayoutAssignment;
  String deploymentStatus;
  bool enableFeeds = false;
  bool enableHistory = false;
  bool enableLicensing = false;
  bool enableReports = false;
  bool enableSearch = false;
  bool enableSharing = false;
  bool enableStreamingApi = true;
  String externalSharingModel;
  String _label;
  String pluralLabel;
  NameField nameField;
  String searchLayouts;
  String sharingModel;
  String visibility;
  String apiName;

  String get label {
    return _label;
  }

  set label(String label) {
    _label = label;
    apiName = label.replaceAll(' ', '_');
    apiName += '__c';
  }

  XmlElement toXML() {
    var builder = XmlBuilder();
    builder.declaration(version: '1.0', encoding: 'UTF-8');
    builder.element('CustomObject',
        attributes: {'xmlns': 'http://soap.sforce.com/2006/04/metadata'},
        nest: () {
      builder
        ..element('label', nest: label)
        ..element('apiName', nest: apiName)
        ..element('pluralLabel', nest: pluralLabel)
        ..element('nameField', nest: nameField.toXML().children)
        ..element('searchLayouts', nest: searchLayouts)
        ..element('sharingModel', nest: sharingModel)
        ..element('visbility', nest: visibility)
        ..element('externalSharingModel', nest: externalSharingModel)
        ..element('enableStreamingApi', nest: enableStreamingApi)
        ..element('enableSharing', nest: enableSharing)
        ..element('enableSearch', nest: enableSearch)
        ..element('enableReports', nest: enableReports)
        ..element('enableLicensing', nest: enableLicensing)
        ..element('enableHistory', nest: enableHistory)
        ..element('enableFeeds', nest: enableFeeds)
        ..element('deploymentStatus', nest: deploymentStatus)
        ..element('compactLayoutAssignment', nest: compactLayoutAssignment)
        ..element('enableBuilkApi', nest: enableBulkApi)
        ..element('ensableActivities', nest: enableActivities)
        ..element('allowChaterGroups', nest: allowInChatterGroups);
    });
    var doc = builder.buildDocument();

    return doc.firstElementChild;
  }
}

class NameField {
  String displayFormat;
  String label;
  bool trackHistory;
  String type;

  NameField(this.label, this.type, this.displayFormat,
      {this.trackHistory = false});

  XmlElement toXML() {
    var builder = XmlBuilder();
    builder.element('nameField', nest: () {
      builder
        ..element('label', nest: label)
        ..element('type', nest: type)
        ..element('displayFormat', nest: displayFormat)
        ..element('trackHistory', nest: trackHistory);
    });

    return builder.buildDocument().firstElementChild;
  }
}
