import QtQuick 2.0
import Ubuntu.Components 1.2
import Ubuntu.Components.Popups 1.2
import KeePass3 1.0

Page {

    property alias txtEntityPass: password
    title: i18n.tr(database.selectedEntry.title)
    head {
            actions: [
                Action {
                    text: i18n.tr("Copy")
                    iconName: "edit-copy"
                    onTriggered: Clipboard.push(password.text);
                },

                Action {
                    text: i18n.tr("Settings")
                    iconName: "settings"
                    onTriggered: PopupUtils.open(settingsDisabledComponent)                    
                }
            ]
    }

    Flow {
        spacing: units.gu(1)
        anchors {
            margins: units.gu(2)
            fill: parent
            }

            Label {
             text:  database.selectedEntry.uuid
             visible: false;
            }           

            Label {
             text: "Username"
             width: parent.width
             color: UbuntuColors.darkAubergine
            }

            TextField {
                id: userName
                text: database.selectedEntry.username
                readOnly: true
                color: UbuntuColors.darkAubergine
            }

            Label {
             text: "Password"
             width: parent.width
             color: UbuntuColors.darkAubergine
            }

            TextField {
                id: password
                text: database.selectedEntry.password
                echoMode : TextInput.Password
                readOnly: true
                width: parent.width
                color: UbuntuColors.darkAubergine
            }

            Button {
                text: "..."
                width: parent.width
                font.pointSize: 12
                color: UbuntuColors.green
                onClicked: {                    
                    if(password.echoMode == TextInput.Normal) {
                        password.echoMode = TextInput.Password;
                    } else {
                        password.echoMode = TextInput.Normal;
                    }
                }
            }           

            Label {
             text: "Url"
             width: parent.width
             color: UbuntuColors.darkAubergine
            }

            TextField {
                id: url
                text: database.selectedEntry.url
                readOnly: true
                width: parent.width
                color: UbuntuColors.darkAubergine
            }

            Label {
             text: "Notes"
             width: parent.width
             color: UbuntuColors.darkAubergine
            }

            TextArea {
                id: notes
                text: database.selectedEntry.notes
                readOnly: true
                width: parent.width
                color: UbuntuColors.darkAubergine
            }
    }
}
