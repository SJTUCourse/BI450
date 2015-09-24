import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2

Rectangle {
//    title: qsTr("Login")
    id: login_gui
    width: 480
    height: 380
    visible: true
    SystemPalette { id: activePalette }

    signal btnLoginClicked(string name,string pw)
    signal btnQuitClicked()

        //Background image
        Image
        {
            id: background
            anchors { top: parent.top; bottom: parent.bottom }
            anchors.fill: parent
            source: "background.jpg"
            fillMode: Image.PreserveAspectCrop
        }

        //Title
        Item
        {
            id: top_bar
            width: login_gui.width
            height: login_gui.height * 0.2
            anchors.top: login_gui.top

            Text
            {
                id: title
                anchors.centerIn: parent
                text: "User Login"
                font.bold: true
                font.pointSize: login_gui.height * 0.09 * 0.7
                color: "dark red"
            }
        }

        //Space
        Item
        {
            id: space1
            width: login_gui.width; height: login_gui.height * 0.1
            anchors.top: top_bar.bottom
        }

        //MessageBox
        MessageDialog
        {
            id: messageDialog
            title: "Warning"
            icon: StandardIcon.Warning
            text: "Check your information."
            onAccepted:close()
            Component.onCompleted: visible = false
        }

        //Login
        Rectangle
        {
            id: rect1
            width: login_gui.width * 0.9; height: login_gui.height * 0.6
            anchors { top: space1.bottom; horizontalCenter: parent.horizontalCenter }
            border.color: "#707070"
            color: "transparent"

            //username
            Item
            {
                id: static_text1
                width: rect1.width * 0.2
                height: rect1.height * 0.2
                anchors { left: rect1.left; leftMargin: 28; top: rect1.top; topMargin: 20}

                Text
                {
                    anchors.centerIn: parent
                    text: "UserName: "
                    font.bold: true
                    font.pointSize: login_gui.height * 0.05 * 0.7
                    color: "black"
                }
            }

            LineInput
            {
                id: username_text
                width: rect1.width * 0.67
                height: rect1.height * 0.2
                anchors { left: static_text1.right; top: rect1.top; topMargin: 20}
                hint: "Please enter your user name"
            }

            //password
            Item
            {
                id: static_text2
                width: rect1.width * 0.2
                height: rect1.height * 0.2
                anchors { left: rect1.left; leftMargin: 28; top: static_text1.bottom; topMargin: 20}

                Text
                {
                    anchors.centerIn: parent
                    text: "Password: "
                    font.bold: true
                    font.pointSize: login_gui.height * 0.05 * 0.7
                    color: "black"
                }
            }

            LineInput
            {
                id: pw_text
                width: rect1.width * 0.67
                height: rect1.height * 0.2
                anchors { left: static_text2.right; top: static_text1.bottom; topMargin: 20}
                hint: "Please enter your password"
                echoMode: TextInput.Password
            }

            //Buttons
            Button
            {
                id: btn_login
                width: rect1.width * 0.35
                height: rect1.height * 0.2
                anchors { left: rect1.left; leftMargin: 28; bottom: rect1.bottom; bottomMargin: 20 }
                text: "Login"
                onClicked: login_req()
            }

            Button
            {
                id: btn_quit
                width: rect1.width * 0.35
                height: rect1.height * 0.2
                anchors { right: rect1.right; rightMargin: 28; bottom: rect1.bottom; bottomMargin: 20 }
                text: "Exit"
                onClicked: quitLogin()
            }
        }

    function login_req()
    {
        if (username_text.text == "")
        {
            messageDialog.text = "User name cannot be vacant!"
            messageDialog.visible = true
            return
        }

        if (pw_text.text == "")
        {
            messageDialog.text = "Password cannot be vacant!"
            messageDialog.visible = true
            return
        }

        btnLoginClicked(username_text.text,pw_text.text)
        return
    }

    function quitLogin()
    {
        btnQuitClicked()
    }

    function showResultMsg(success)
    {
        if (success)
        {
            messageDialog.text = "Successful login."
            messageDialog.visible = true;
        }
        if (!success)
        {
            messageDialog.text = "Login failed."
            messageDialog.visible = true;
        }
        return
    }
}
