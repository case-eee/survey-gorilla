
User.create(email: "admin", password: "password")

20.times do
  user = User.create(
    email: Faker::Internet.email,
    password: Faker::Lorem.word,
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

    Option.create(
      question_id: question.id,
      answer: Faker::Company.catch_phrase
    )
  end

  take_survey = Survey.all.sample

  survey_taker = Surveytaker.create(
    user_id: user.id,
    survey_id: take_survey.id
  )

  take_survey.questions.each do |question|
    question.options.each do |option|
      Response.create(
        user_id: user.id,
        option_id: option.id
      )
    end
  end
end
