$(function() {
  $('#question').on('submit', function(event) {
    event.preventDefault();
    console.log("Here");
    var data = $('form input').data();
    console.log(data);
    var url = "/surveys/"+ data.id +"/questions/"+ data.counter;
    console.log(url);

    $.get(url, data, function(response){
      console.log(response);
      console.log('RESPONSE');
      console.log(response);
      var nextQuestion = $.parseJSON(response);
      // console.log(nextQuestion);
      if (nextQuestion.counter !== null) {

      var content = nextQuestion.current_question.question.content
      var options = nextQuestion.current_options;
      var counter = nextQuestion.counter


        $('h2').html(content);

        _.each(options, function(element, index) {
          var eachAnswer = element.option.answer;
          var answerOpts = $('#question span')
          console.log(answerOpts[0]);
          console.log(typeof answerOpts);
          answerOpts.eq(index).html(eachAnswer);
        });
      } else {
        window.location.href = "http://localhost:9393/surveys/" + nextQuestion.survey_id + "/results";
      }
    });
  });
});
