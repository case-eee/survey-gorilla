
User.create(email: "admin", password: "password")

20.times do
  user = User.create(
    email: Faker::Internet.email,
    password: "password",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )

  survey  = Survey.create(
    user_id: user.id,
    title: Faker::Company.name
  )

  10.times do
    question = Question.create(
      survey_id: survey.id,
      content: Faker::Company.bs
    )
    3.times do
      Option.create(
        question_id: question.id,
        answer: Faker::Company.catch_phrase
      )
    end
  end

  take_survey = Survey.all.sample

  survey_taker = Surveytaker.create(
    user_id: user.id,
    survey_id: take_survey.id
  )

  take_survey.questions.each do |question|
    Response.create(
      user_id: user.id,
      question_id: question.id,
      option_id: question.options.sample.id
    )
  end
end
