get '/surveys' do  # Show all
  @surveys = Survey.all

  erb :all_surveys
end

get '/surveys/new' do  # Step1.) Create

  erb :new_survey
end

post '/surveys' do  # Step2.) Create
  survey = Survey.create(user_id: current_user.id, title: params[:title])

  redirect "/surveys/#{survey.id}/edit"
end

get '/surveys/:id' do  # Show specific
  @survey = Survey.find(params[:id])
  @questions = @survey.questions

  erb :show_survey
end

post '/surveys/:id' do
  @survey = Survey.find(params[:id])
  Question.create(survey_id: @survey.id, content: params[:content])
  if params[:complete]
    redirect "/surveys/#{@survey.id}"
  else params[:add_question]
    redirect "/surveys/#{@survey.id}/edit"
  end
end

get '/surveys/:id/edit' do  # Step1.) Edit
  @survey = Survey.find(params[:id])
  @questions = @survey.questions


  erb :add_questions
end

patch '/surveys/:id/questions/:question_id' do
  @survey = Survey.find(params[:id])
  @question = @survey.questions.find(params[:question_id])

  @question.update_attributes(params[:question])
  redirect "/surveys/#{@survey.id}/edit"

end

patch '/surveys/:id/options/:option_id' do
  option = Option.find(params[:option_id])

  option.update_attributes(params[:options])
  redirect "/surveys/#{params[:id]}/edit"

end

put '/surveys/:id' do  # Step2.) Edit


end

delete '/surveys/:id' do  # Delete

end

get '/surveys/:id/results' do

end
