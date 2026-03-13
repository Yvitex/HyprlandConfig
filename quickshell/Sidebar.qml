// ══════════════════════════════════════════════════════════════════
//  ✦ SIDEBAR PANEL — "Maid's Devotion" Theme ✦
//  Calendar · Media player with art · Maid quote
// ══════════════════════════════════════════════════════════════════
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io

PanelWindow {
    anchors { top: true; right: true; bottom: true }
    margins { top: 57; right: 22; bottom: 8 }
    exclusionMode: ExclusionMode.Ignore
    width: 200
    color: "transparent"

    // ── Calendar state ──────────────────────────────────────────────
    property int displayYear:  new Date().getFullYear()
    property int displayMonth: new Date().getMonth()   // 0-indexed

    readonly property var monthNames: [
        "January","February","March","April","May","June",
        "July","August","September","October","November","December"
    ]
    readonly property var dayHeaders: ["Su","Mo","Tu","We","Th","Fr","Sa"]

    property var calendarCells: buildCells(displayYear, displayMonth)

    function buildCells(y, m) {
        const firstDay  = new Date(y, m, 1).getDay()
        const daysCount = new Date(y, m + 1, 0).getDate()
        const cells = []
        for (let i = 0; i < firstDay; i++)      cells.push(-1)
        for (let d = 1; d <= daysCount; d++)    cells.push(d)
        while (cells.length % 7 !== 0)          cells.push(-1)
        return cells
    }

    function prevMonth() {
        if (displayMonth === 0) { displayMonth = 11; displayYear-- }
        else displayMonth--
        calendarCells = buildCells(displayYear, displayMonth)
    }

    function nextMonth() {
        if (displayMonth === 11) { displayMonth = 0; displayYear++ }
        else displayMonth++
        calendarCells = buildCells(displayYear, displayMonth)
    }

    // ── Media state ─────────────────────────────────────────────────
    property string trackTitle:  ""
    property string trackArtist: ""
    property string trackArtUrl: ""
    property bool   trackPlaying: false
    property bool   hasMedia: trackTitle.length > 0

    // ── Quote ────────────────────────────────────────────────────────
    property string quoteText: "Your devoted maid awaits."
    readonly property var quotes: [
        "Your humble servant stands ready.",
        "It shall be done at once, Master.",
        "I exist to serve your every need.",
        "Master's comfort is my purpose.",
        "I have prepared everything for you.",
        "Your wish is my command, always.",
        "Leave the rest to me, Master.",
        "I shall not fail you.",
        "Nothing shall trouble you today.",
        "Rest easy. I am here.",
        "Your satisfaction is my reward.",
        "Consider it done, Master."
    ]

    // ── Panel ────────────────────────────────────────────────────────
    Rectangle {
        anchors.fill: parent
        color: Qt.rgba(13/255, 11/255, 15/255, 0.92)
        border.color: Qt.rgba(200/255, 99/255, 138/255, 0.32)
        border.width: 1
        radius: 14
        clip: true

        ColumnLayout {
            anchors { fill: parent; margins: 12 }
            spacing: 0

            // ── Header ───────────────────────────────────────────────
            Text {
                text: "✦  At Your Service  ✦"
                color: "#D4AF37"
                font.pixelSize: 10
                Layout.alignment: Qt.AlignHCenter
                Layout.bottomMargin: 8
            }

            // ── Clock ────────────────────────────────────────────────
            Text {
                id: clockText
                Layout.alignment: Qt.AlignHCenter
                color: "#F0E8F0"
                font.pixelSize: 30
                font.bold: true
                text: Qt.formatTime(new Date(), "hh:mm")
            }

            Text {
                id: dateText
                Layout.alignment: Qt.AlignHCenter
                color: "#9E8EA0"
                font.pixelSize: 10
                Layout.bottomMargin: 10
                text: Qt.formatDate(new Date(), "dddd, MMMM d")
            }

            Timer {
                interval: 1000; running: true; repeat: true
                onTriggered: {
                    clockText.text = Qt.formatTime(new Date(), "hh:mm")
                    dateText.text  = Qt.formatDate(new Date(), "dddd, MMMM d")
                }
            }

            // ── Divider ──────────────────────────────────────────────
            Rectangle {
                height: 1
                color: Qt.rgba(200/255, 99/255, 138/255, 0.28)
                Layout.fillWidth: true
                Layout.bottomMargin: 8
            }

            // ── Calendar navigation ──────────────────────────────────
            RowLayout {
                Layout.fillWidth: true
                Layout.bottomMargin: 4

                Text {
                    text: "‹"
                    color: "#C8638A"
                    font.pixelSize: 14
                    font.bold: true
                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: prevMonth()
                    }
                }

                Item { Layout.fillWidth: true }

                Text {
                    text: monthNames[displayMonth] + "  " + displayYear
                    color: "#F0E8F0"
                    font.pixelSize: 11
                    font.bold: true
                }

                Item { Layout.fillWidth: true }

                Text {
                    text: "›"
                    color: "#C8638A"
                    font.pixelSize: 14
                    font.bold: true
                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: nextMonth()
                    }
                }
            }

            // ── Day-of-week headers ──────────────────────────────────
            Row {
                Layout.fillWidth: true
                Layout.bottomMargin: 2
                spacing: 0

                Repeater {
                    model: dayHeaders
                    delegate: Text {
                        width: (parent.parent.width) / 7
                        text: modelData
                        color: "#9E8EA0"
                        font.pixelSize: 9
                        horizontalAlignment: Text.AlignHCenter
                    }
                }
            }

            // ── Calendar grid ────────────────────────────────────────
            Grid {
                columns: 7
                Layout.fillWidth: true
                Layout.bottomMargin: 10

                Repeater {
                    model: calendarCells
                    delegate: Item {
                        readonly property int day:     modelData
                        readonly property bool isToday:
                            day === new Date().getDate() &&
                            displayMonth === new Date().getMonth() &&
                            displayYear  === new Date().getFullYear()

                        width:  Math.floor(176 / 7)
                        height: 20

                        Rectangle {
                            visible: isToday
                            anchors.centerIn: parent
                            width: 18; height: 18; radius: 9
                            color: Qt.rgba(200/255, 99/255, 138/255, 0.35)
                            border.color: "#C8638A"
                            border.width: 1
                        }

                        Text {
                            anchors.centerIn: parent
                            text: day > 0 ? day : ""
                            color: isToday ? "#F0E8F0"
                                 : day > 0 ? "#D8D0D8"
                                 : "transparent"
                            font.pixelSize: 10
                            font.bold: isToday
                        }
                    }
                }
            }

            // ── Divider ──────────────────────────────────────────────
            Rectangle {
                height: 1
                color: Qt.rgba(212/255, 175/255, 55/255, 0.20)
                Layout.fillWidth: true
                Layout.bottomMargin: 8
            }

            // ── Media player ─────────────────────────────────────────
            ColumnLayout {
                Layout.fillWidth: true
                spacing: 6
                visible: hasMedia

                // Album art + info
                RowLayout {
                    Layout.fillWidth: true
                    spacing: 8

                    // Album art
                    Rectangle {
                        width: 52; height: 52
                        radius: 8
                        color: Qt.rgba(37/255, 30/255, 46/255, 0.8)
                        clip: true

                        Image {
                            anchors.fill: parent
                            source: trackArtUrl
                            fillMode: Image.PreserveAspectCrop
                            visible: trackArtUrl.length > 0
                            layer.enabled: true
                        }

                        // Placeholder note icon when no art
                        Text {
                            anchors.centerIn: parent
                            visible: trackArtUrl.length === 0
                            text: "♫"
                            color: "#C8638A"
                            font.pixelSize: 22
                        }
                    }

                    // Track info
                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 2

                        Text {
                            Layout.fillWidth: true
                            text: trackTitle
                            color: "#F0E8F0"
                            font.pixelSize: 11
                            font.bold: true
                            elide: Text.ElideRight
                        }

                        Text {
                            Layout.fillWidth: true
                            text: trackArtist
                            color: "#9E8EA0"
                            font.pixelSize: 10
                            elide: Text.ElideRight
                        }

                        // Play/pause button
                        Text {
                            text: trackPlaying ? "⏸  Pause" : "▶  Play"
                            color: "#C8638A"
                            font.pixelSize: 10
                            MouseArea {
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: toggleProc.running = true
                            }
                        }
                    }
                }
            }

            // Placeholder when no media
            Text {
                visible: !hasMedia
                text: "No media playing"
                color: Qt.rgba(158/255, 142/255, 160/255, 0.5)
                font.pixelSize: 10
                font.italic: true
                Layout.alignment: Qt.AlignHCenter
                Layout.bottomMargin: 4
            }

            Item { Layout.fillHeight: true }

            // ── Quote ────────────────────────────────────────────────
            Rectangle {
                height: 1
                color: Qt.rgba(200/255, 99/255, 138/255, 0.28)
                Layout.fillWidth: true
                Layout.bottomMargin: 6
            }

            Text {
                text: quoteText
                color: "#9E8EA0"
                font.pixelSize: 10
                font.italic: true
                wrapMode: Text.WordWrap
                Layout.fillWidth: true
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }

    // ── Media polling ────────────────────────────────────────────────
    Process {
        id: mediaProc
        command: ["bash", "-c",
            "playerctl metadata --format '{{status}}|||{{title}}|||{{artist}}|||{{mpris:artUrl}}' 2>/dev/null || echo '|||'"]
        running: false
        stdout: SplitParser {
            onRead: data => {
                const p = data.trim().split("|||")
                trackPlaying = (p[0] === "Playing")
                trackTitle   = p.length > 1 ? p[1] : ""
                trackArtist  = p.length > 2 ? p[2] : ""
                trackArtUrl  = p.length > 3 ? p[3] : ""
            }
        }
    }

    Process {
        id: toggleProc
        command: ["playerctl", "play-pause"]
        running: false
    }

    Timer {
        interval: 2000; running: true; repeat: true
        onTriggered: { if (!mediaProc.running) mediaProc.running = true }
    }

    // ── Quote rotation ───────────────────────────────────────────────
    Timer {
        interval: 60000; running: true; repeat: true
        onTriggered: quoteText = quotes[Math.floor(Math.random() * quotes.length)]
    }
}
