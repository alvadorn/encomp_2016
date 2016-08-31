$(document).ready(function() {
  changeHidden();
});

$("#minicourses input[type=checkbox]").click(function() {
  var checkboxSwap = $("#minicourses input:checkbox.change");
  changeCheckBox(checkboxSwap, this);
  changeHidden();
});

var changeHidden = function() {
  var checkMaratona = $("#user_courses_torneio_de_programao");
  var field = $("#user_team_name");
  if (checkMaratona.is(":checked")) {
    field[0].style.display = "inline";
  } else {
    field[0].style.display = "none";
  }
}

var changeCheckBox = function(swap, that) {
  var className = "." + swap.context.activeElement.className;
  var id = swap.context.activeElement.id;
  var value = className + ":not(#" + id +")";
  if ($(that).is(":checked")) {
    $(value).attr("disabled", "disabled");
  } else {
    $(value).removeAttr("disabled", "disabled");
  }
}
