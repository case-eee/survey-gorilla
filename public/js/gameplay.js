$(function() {
  $('#question').on('submit', function(event) {
    event.preventDefault();
    console.log("Here");
    var data = $('form input').data();
    console.log(data);
    var url = "/surveys/"+ data.id +"/questions/"+ data.counter;
    console.log(url);

    $.get(url, data, function(response){
      // console.log(response);
      var nextQuestion = $.parseJSON(response);
      console.log(nextQuestion);

      var content = nextQuestion.current_question.question.content
      console.log(content);

      var options = nextQuestion.current_options;
      console.log(options);

      $('h2').html(content);

      _.each(options, function(element, index) {
        var eachAnswer = element.option.answer;
        var answerOpts = $('#question span')
        console.log(answerOpts[0]);
        console.log(typeof answerOpts);
        answerOpts.eq(index).html(eachAnswer);
      });


    });
  });
});

//target h2, replace it with question content
//grab the current options array, iterate through it and replace each option.

// {"current_question":{"question":{"content":"reintermediate plug-and-play applications","created_at":"2014-05-23T15:30:22-05:00","id":114,"survey_id":12,"updated_at":"2014-05-23T15:30:22-05:00"}},"current_options":[{"option":{"answer":"Focused uniform budgetary management","created_at":"2014-05-23T15:30:22-05:00","id":340,"question_id":114,"updated_at":"2014-05-23T15:30:22-05:00"}},{"option":{"answer":"Progressive 6th generation success","created_at":"2014-05-23T15:30:22-05:00","id":341,"question_id":114,"updated_at":"2014-05-23T15:30:22-05:00"}},{"option":{"answer":"Business-focused coherent hardware","created_at":"2014-05-23T15:30:22-05:00","id":342,"question_id":114,"updated_at":"2014-05-23T15:30:22-05:00"}}]}
