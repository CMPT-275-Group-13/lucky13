/**
 * doctor-profile.js
 */

firebase.auth().onAuthStateChanged(function(user) {
  if (user) {
    firestoreDisplayUser(user.email);
  }
});

$(document).ready(function() {
  $("#profile-change-status").text();
  $("#profile-change-status").hide();

  $("#profile-change-btn").click(function() {
    $("#profile-change-status").text();
    $("#profile-change-status").hide();

    var docData = {
      email: $("input#profile-email").val(),
      firstName: $("input#profile-first-name").val(),
      lastName: $("input#profile-last-name").val(),
      title: $("input#profile-title").val(),
      phone: $("input#profile-phone").val()
    };

    if (!validateEmail(docData['email'])) {
      $("#profile-change-status").show();
      $("#profile-change-status").text("Invalid email address format");
    }
    // Update doctor's profile
    else {
      firestoreUpdateUser(docData, "doctors");
      $("#profile-change-status").text("Update successful!");
      $("#profile-change-status").show();
    }
    return false;
  });
});
