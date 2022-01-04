// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
import "@fortawesome/fontawesome-free/js/all";

Rails.start();
Turbolinks.start();
ActiveStorage.start();

document.addEventListener("DOMContentLoaded", () => {
    (document.querySelectorAll(".notification .delete") || []).forEach(
        ($delete) => {
            const $notification = $delete.parentNode;

            $delete.addEventListener("click", () => {
                $notification.parentNode.removeChild($notification);
            });
        }
    );

    let loginLink = document.querySelector("#loginLink");
    let loginName = document.querySelector("#user_name");
    let regitrationName = document.querySelector("#user_name_registration");
    let loginForm = document.querySelector("#loginForm");
    let registerLink = document.querySelector("#registerLink");
    let registerForm = document.querySelector("#registerForm");

    loginLink.addEventListener("click", () => {
        loginLink.parentNode.classList.add("is-active");
        registerLink.parentNode.classList.remove("is-active");
        loginForm.style.display = "block";
        registerForm.style.display = "none";
        window.location.hash = "login";
        loginName.focus();
    });

    registerLink.addEventListener("click", () => {
        loginLink.parentNode.classList.remove("is-active");
        registerLink.parentNode.classList.add("is-active");
        loginForm.style.display = "none";
        registerForm.style.display = "block";
        window.location.hash = "registration";
        regitrationName.focus();
    });

    let hash = window.location.hash;
    console.log("hash:" + hash)

    if (hash === '#login' || !hash) {
        console.log("login")
        loginLink.parentNode.classList.add("is-active");
        registerLink.parentNode.classList.remove("is-active");
        loginForm.style.display = "block";
        registerForm.style.display = "none";
        loginName.focus();
    } else {
        console.log("regitration")
        loginLink.parentNode.classList.remove("is-active");
        registerLink.parentNode.classList.add("is-active");
        loginForm.style.display = "none";
        registerForm.style.display = "block";
        regitrationName.focus();
    }
});

import "controllers";
