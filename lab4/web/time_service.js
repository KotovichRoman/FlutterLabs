function getCurrentTime() {
    var date = new Date();
    var hours = date.getHours();
    var minutes = date.getMinutes();
    var seconds = date.getSeconds();
    var timeString = hours.toString().padStart(2, '0') + ':' + minutes.toString().padStart(2, '0') + ':' + seconds.toString().padStart(2, '0');
    return Promise.resolve(timeString);
  }

  if (window.flutterWebviewPlugin) {
    window.flutterWebviewPlugin.registerHandler('time_service#getCurrentTime', getCurrentTime);
  }