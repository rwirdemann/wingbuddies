// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "@fortawesome/fontawesome-free/js/all";

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener('DOMContentLoaded', () => {
    (document.querySelectorAll('.notification .delete') || []).forEach(($delete) => {
        const $notification = $delete.parentNode;

        $delete.addEventListener('click', () => {
            $notification.parentNode.removeChild($notification);
        });
    });
    

    var loginLink = document.querySelector('#loginLink');
    var registerLink = document.querySelector('#registerLink');
    loginLink.addEventListener('click', () => {
        loginLink.parentNode.classList.toggle("is-active")
        registerLink.parentNode.classList.toggle("is-active")
    });

    registerLink.addEventListener('click', () => {
        registerLink.parentNode.classList.toggle("is-active")
        loginLink.parentNode.classList.toggle("is-active")
    });
});

import 'controllers'
