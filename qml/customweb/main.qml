import QtQuick 1.1
import RockyBars 1.0
import "browser.js" as Browser
import "hook.js" as Hook

Rectangle {
    width: 360
    height: 360

    RockyWebView {
        id: webView
        url:  "http://dev.rockybars.com:3001/form2.html"
        anchors.fill: parent
        preferredHeight: parent.height
        preferredWidth: parent.width

        onLoadFinished: {
            loading.visible = false
            Browser.execute(webView, Browser.shims)
            Browser.execute(webView, Hook.intercept)
        }

        onLoadStarted : {
            loading.visible = true

        }

        onHeightChanged: {
           Browser.execute(webView, Browser.forceScroller, parent.height)
        }

        javaScriptWindowObjects: QtObject{
            RockyWebView.windowObjectName: "hook"
            function process(str){
                var obj;
                try {
                    obj = JSON.parse(str)
                }
                catch(e) {
                    obj = []
                }
                if(obj) {
                    console.log(JSON.stringify(obj, null, 2))
                }
            }
        }
    }

    Rectangle{
        id: loading
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height: 10
        color: "red"
        visible: false
    }
}
