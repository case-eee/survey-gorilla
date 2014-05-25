get '/options' do  # Show all

end

get '/options/new' do  # Step1.) Create

end

post '/options' do  # Step2.) Create

end

post '/surveys/:id/questions/:question_id/options' do  # Show specific
  question = Question.find(params[:question_id])
  survey = Survey.find(params[:id])

  Option.create(answer: params[:answer], question_id: question.id )
  redirect "/surveys/#{survey.id}/edit"
end

get '/options/:id/edit' do  # Step1.) Edit

end

patch '/options/:id' do  # Step2.) Edit

end

delete '/options/:id' do  # Delete

end
