// ══════════════════════════════════════════════════════════════════
//  ✦ QUICKSHELL — "Maid's Devotion" Shell ✦
// ══════════════════════════════════════════════════════════════════
import QtQuick
import Quickshell

ShellRoot {

    // ── Toggle tab — always visible on the right edge ──────────────
    PanelWindow {
        id: toggleTab

        property bool sidebarOpen: false

        anchors { top: true; right: true; bottom: true }
        exclusionMode: ExclusionMode.Ignore
        width: 20
        color: "transparent"

        Rectangle {
            anchors {
                right: parent.right
                verticalCenter: parent.verticalCenter
            }
            width: 20
            height: 64
            radius: 6
            color: Qt.rgba(200/255, 99/255, 138/255, 0.85)

            Text {
                anchors.centerIn: parent
                text: toggleTab.sidebarOpen ? "›" : "‹"
                color: "#F0E8F0"
                font.pixelSize: 14
                font.bold: true
            }

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: toggleTab.sidebarOpen = !toggleTab.sidebarOpen
            }

            // Gentle pulse when closed
            SequentialAnimation on opacity {
                running: !toggleTab.sidebarOpen
                loops: Animation.Infinite
                NumberAnimation { to: 0.55; duration: 1200; easing.type: Easing.InOutSine }
                NumberAnimation { to: 1.00; duration: 1200; easing.type: Easing.InOutSine }
            }
        }
    }

    // ── Sidebar panel — hidden until tab is clicked ─────────────────
    Sidebar {
        visible: toggleTab.sidebarOpen
    }
}
