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
          buildWarningDiv(signInForm, res.body.errors);
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
          buildWarningDiv(signUpForm, res.body.errors);
        } else {
          window.location.href = '/app';
        }
      });
    })
  }

  var buildWarningDiv = function(form, errors) {
    if (errors.hasOwnProperty('password')) {
      var passwordWarning = form.querySelector('[data-js=password-warning]');
      if (passwordWarning) {
        passwordWarning.remove();
      }
      var passwordGroup = form.querySelector('[data-js=password-group]');
      passwordGroup.classList.add('has-error');
      var warning = document.createElement('div');
      warning.setAttribute('data-js', 'password-warning');
      warning.className = 'text-danger';
      warning.innerHTML = errors.password[0];
      var warningDiv = form.querySelector('[data-js=warning]');
      warningDiv.appendChild(warning);
    } else {
      var passwordGroup = form.querySelector('[data-js=password-group]');
      passwordGroup.classList.remove('has-error');
      var passwordWarning = form.querySelector('[data-js=password-warning]');
      if (passwordWarning) {
        passwordWarning.remove();
      }
    }
    if (errors.hasOwnProperty('email')) {
      var emailWarning = form.querySelector('[data-js=email-warning]');
      if (emailWarning) {
        emailWarning.remove();
      }
      var emailGroup = form.querySelector('[data-js=email-group]');
      emailGroup.classList.add('has-error');
      var warning = document.createElement('div');
      warning.setAttribute('data-js', 'email-warning');
      warning.className = 'text-danger';
      warning.innerHTML = errors.email[0];
      var warningDiv = form.querySelector('[data-js=warning]');
      var passwordWarning = form.querySelector('[data-js=password-warning]');
      if (passwordWarning) {
        warningDiv.insertBefore(warning, passwordWarning)
      } else {
        warningDiv.appendChild(warning);
      }
    } else {
      var emailGroup = form.querySelector('[data-js=email-group]');
      emailGroup.classList.remove('has-error');
      var emailWarning = form.querySelector('[data-js=email-warning]');
      if (emailWarning) {
        emailWarning.remove();
      }
    }
  }

};

module.exports = users;
