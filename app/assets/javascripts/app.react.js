var React = require('react');
var ReactDOM = require('react-dom');
var Redux = require('redux');
var ReactRedux = require('react-redux');
var Provider = ReactRedux.Provider;
// var Store = require('./store/store.redux.js');
// var Router = require('./containers/router.react.js');

var app = function() {

  var appMain = document.querySelector('[data-js=app_main]');

  if (appMain) {
    console.log('rendering main application');
    // ReactDOM.render(
    //   <Provider store={Store}>
    //     <Router />
    //   </Provider>, div
    // );
  }

};

module.exports = app;
