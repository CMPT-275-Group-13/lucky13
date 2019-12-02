/**
 * doctor-profile.js
 */

$(document).ready(function() {
  $("#profile-change-status").text();
  $("#profile-change-status").hide();

  firebase.auth().onAuthStateChanged(function(user) {
    if (user) {
      console.log(user.eamil);
      firestoreDisplayUser(user.email);
    }
  });

  $("#profile-change-btn").click(function() {
    $("#profile-change-status").text();
    $("#profile-change-status").hide();

    var docData = {
      email: jQueryReadValfromHTML("input#profile-email"),
      email: jQueryReadValfromHTML("input#profile-email"),
      firstName:jQueryReadValfromHTML("input#profile-first-name"),
      lastName: jQueryReadValfromHTML("input#profile-last-name"),
      title: jQueryReadValfromHTML("input#profile-title"),
      phone: jQueryReadValfromHTML("input#profile-phone")
    };

    if (!validateEmail(docData.email)) {
      console.log(docData.email);
      jQueryWriteTextToHTML("#profile-change-status", "Invalid email address format");
    }
    // Update doctor's profile
    else {
      firestoreUpdateUser(docData, "doctors");
      jQueryWriteTextToHTML("#profile-change-status", "Update successful!");
    }
    return false;
  });
});
