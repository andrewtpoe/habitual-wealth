var Ajax = require('./ajax.js');

var users = function() {

  var signUpLink = document.querySelector('[data-js=sign-up-link]');
  var signInLink = document.querySelector('[data-js=sign-in-link]');
  var signUpForm = document.querySelector('[data-js=sign-up-form]');
  var signInForm = document.querySelector('[data-js=sign-in-form]');

  if (signUpLink) {
    signUpLink.addEventListener('click', function(event) {
      event.preventDefault();
      signInForm.classList.remove('in');
      signUpForm.classList.add('in');
    })
  }

  if (signInLink) {
    signInLink.addEventListener('click', function(event) {
      event.preventDefault();
      signInForm.classList.add('in');
      signUpForm.classList.remove('in');
    })
  }

  if (signInForm) {
    signInForm.addEventListener('submit', function(event) {
      event.preventDefault();
      var url = 'api/log_in';
      var email = signInForm.querySelector('[data-js=email]').value;
      var password = signInForm.querySelector('[data-js=password]').value;
      var formData = {
        user: {
          email: email,
          password: password
        }
      }
      Ajax.postData(url, formData, function(err, res) {
        if (err) {
          this.buildWarningDiv();
        } else {
          window.location.href = '/app';
        }
      });
    })
  }

  if (signUpForm) {
    signUpForm.addEventListener('submit', function(event) {
      event.preventDefault();
      var url = 'api/sign_up';
      var email = signUpForm.querySelector('[data-js=email]').value;
      var password = signUpForm.querySelector('[data-js=password]').value;
      var passwordConfirmation = signUpForm.querySelector('[data-js=password-confirmation]').value;
      var formData = {
        user: {
          email: email,
          password: password,
          password_confirmation: passwordConfirmation
        }
      }
      Ajax.postData(url, formData, function(err, res) {
        if (err) {
          this.buildWarningDiv();
        } else {
          window.location.href = '/app';
        }
      });
    })
  }

  buildWarningDiv: function() {
    console.log(err.status);
  }

};

module.exports = users;
