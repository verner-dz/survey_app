var collapseDivs = function() {
  var collapsables = $('.collapsible-question');
  collapsables.each(function(i){
    var label = $(this).find('.question-section').filter(':first');
    var fields = $(this).find('.fields-section').filter(':first');
    label.click(function(e) {
      fields.slideToggle(200);
    });
  });
};


var hideAnswers = function() {
  var collapsables = $('.collapsible-question');
  collapsables.each(function(i) {
    var questionSelector = $(this).find('.question_type_selector').filter(':first');
    var answers = $(this).find('.answers-section').filter(':first');
    questionSelector.on('change', function() {
      if(questionSelector.val() == "Dropdown" || questionSelector.val() == "Checkbox"){
        answers.show();
      } else if(questionSelector.val() == "Text") {
        answers.hide();
      }
    });
  });
};

$(document).on('click', 'form .remove_fields', function(event) {
  $(this).prev('input[type=hidden]').val('1');
  $(this).closest('fieldset').hide();
  return event.preventDefault();
});

$(document).on('click', 'form .add_fields', function(event) {
  var regexp, time;
  time = new Date().getTime();
  regexp = new RegExp($(this).data('id'), 'g');
  $(this).before($(this).data('fields').replace(regexp, time));
  collapseDivs();
  hideAnswers();
  return event.preventDefault();
});


$(function(){
  hideAnswers();
  collapseDivs();
  $('form#response_form').submit(function(event) {
      var formData = [];
      var name = $('.response_name_val').val();
      $('.label_question').each(function(i, v) {
        if($(this).next().hasClass("checkbox_answer")) {
          var selectedCheckBoxes = [];
          $(".checkbox_answer").each(function(i,v) {
            if($(this).find("input").prop("checked")) {
              selectedCheckBoxes.push($(this).find("input").val());
            }
          });
          formData.push({"Question": $(this).text(), "Answer": selectedCheckBoxes, "Type": "Checkbox"});
        } else if($(this).next().hasClass("dropdown_answer")) {
            formData.push({"Question": $(this).text(), "Answer": $(this).next().val(), "Type": "Dropdown"});
        } else if($(this).next().hasClass("text_answer")) {
          formData.push({"Question": $(this).text(), "Answer": $(this).next().val(), "Type": "Text"});
        }
      });
      console.log(formData);
      var formURL = $(this).attr("action");

      $.ajax({
          type: "POST",
          url: formURL,
          beforeSend: function(xhr) {
            xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
          },
          data: {
                  "responses": {
                    "name": name,
                    "data": formData,
                    "survey_id": $("input[name=survey_id]").val()
                  }
                },
          dataType: "json",
          success: function(data) {
            console.log("Successful post. Data returned is " + data);
            window.location.href = formURL;
          }
      });
  });
  event.preventDefault();
});



