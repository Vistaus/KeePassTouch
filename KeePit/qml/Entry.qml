/*
* This file is part of KeePit
*
* Copyright (C) 2016 Dan Beavon
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/

import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3
import KeePass3 1.0

Page {

    header: PageHeader {
      id: pageHeader
      title: i18n.tr(database.selectedEntry.title)
      trailingActionBar.actions: [
        Action {
            iconName: "system-log-out"
            text: i18n.tr("Logout")
            onTriggered: {
                reset();
            }
        }
        ,
        /*
        Action {
            text: i18n.tr("Settings")
            iconName: "settings"
            onTriggered: PopupUtils.open(settingsDisabledComponent)
        }*/
        Action {
            text: i18n.tr("Copy")
            iconName: "edit-copy"
            onTriggered: Clipboard.push(password.text);
        }
      ]
    }

    Flow {
      spacing: units.gu(1)
      anchors {
        margins: units.gu(2)
        fill: parent
        topMargin: pageHeader.height + units.gu(2)
      }

      Label {
       text:  database.selectedEntry.uuid
       visible: false;
      }

      Label {
       text: i18n.tr("Username")
       width: parent.width
      }

      TextField {
        id: userName
        text: database.selectedEntry.username
        readOnly: true
      }

      Label {
       text: i18n.tr("Password")
       width: parent.width
      }

      PasswordInput {
        id: password
        inputWidth: parent.width
        text: database.selectedEntry.password
        readOnly: true
        placeholderText: ''
      }

      Label {
       text: i18n.tr("Url")
       width: parent.width
      }

      TextField {
        id: url
        text: database.selectedEntry.url
        readOnly: true
        width: parent.width
      }

      Label {
       text: i18n.tr("Notes")
       width: parent.width
      }

      TextArea {
        id: notes
        text: database.selectedEntry.notes
        readOnly: true
        width: parent.width
      }
    }
}
