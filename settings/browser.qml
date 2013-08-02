import QtQuick 2.0
import Sailfish.Silica 1.0
import org.sailfishos.browser.settings 1.0

Page {
    Label {
        anchors.centerIn: parent
        text: settings.testProp
    }

    BrowserSettings {
        id: settings
    }
}