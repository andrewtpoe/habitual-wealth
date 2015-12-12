var Request = require('superagent');

var ajax = {

  postData: function(url, formData, callback) {
    console.log('posting ', formData, 'to ', url);
    var token = document.getElementsByName('csrf-token')[0].content;
    Request
    .post(url)
    .send(formData)
    .set('Accept', 'application/json')
    .set('Content-Type', 'application/json')
    .set('X-CSRF-Token', token)
    .end(callback);
  }

}

module.exports = ajax;
