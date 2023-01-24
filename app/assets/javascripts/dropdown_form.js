// credits go to chatGPT

$(document).ready(function() {
    $('#options').change(function() {
      if ($(this).val() == "Student Sign Up") {
        $('#form1').show();
        $('#form2').hide();
      } else if ($(this).val() == "Lecturer Sign Up") {
        $('#form1').hide();
        $('#form2').show();
      }
    });
  });
