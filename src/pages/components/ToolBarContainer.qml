/****************************************************************************
**
** Copyright (C) 2013 Jolla Ltd.
** Contact: Raine Makelainen <raine.makelainen@jollamobile.com>
**
****************************************************************************/

/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this file,
 * You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
import Sailfish.Silica 1.0
import Sailfish.Browser 1.0

PanelBackground {
    height: calculateToolbarHeight()

    Image {
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
        source: "image://theme/graphic-gradient-edge"
    }

    Rectangle {
        anchors.fill: parent
        opacity: 0.3
        color: Theme.highlightBackgroundColor
        visible: !WebUtils.firstUseDone
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {}
    }

    function calculateToolbarHeight() {
        // Height of toolbar should be such that viewport height is
        // even number both chrome and fullscreen modes. For instance
        // height of 110px for toolbar would result 1px rounding
        // error in chrome mode as viewport height would be 850px. This would
        // result in CSS pixels viewport height of 566.66..px -> rounded to 566px.
        // So, we make sure below that (device height - toolbar height) / pixel ratio is even number.
        // target values when Theme.pixelratio == 1 are:
        // portrait: 108px
        // landcape: 78px

        var sizeInSettings = isPortrait ? Settings.toolbarLarge : Settings.toolbarSmall
        var screenHeight = isPortrait ? Screen.height : Screen.width
        var targetHeight = sizeInSettings * Theme.pixelRatio
        var viewportSize = screenHeight - targetHeight
        var roundedHeight = Math.floor(viewportSize / WebUtils.cssPixelRatio) * WebUtils.cssPixelRatio
        return screenHeight - roundedHeight
    }
}
