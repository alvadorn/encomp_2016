$("#minicourses input[type=checkbox]").click(function() {
  var checkboxSwap = $("#minicourses input:checkbox.change");
  changeCheckBox(checkboxSwap, this);
});

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
