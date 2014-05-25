get '/surveys/:id/questions' do  # Show all
  survey = Survey.find(params[:id])
  session[:counter] = 0
  redirect to "/surveys/#{params[:id]}/questions/#{session[:counter] + 1}"
end

get '/questions/new' do  # Step1.) Create

end

# post '/surveys/:id/questions/:counter' do  # Step2.) Create


#   return "happiness"
# end

get '/surveys/:id/questions/:counter' do  # Show specific
  p params
  @survey = Survey.find(params[:id])
  puts params[:counter]

if session[:counter] < @survey.questions.length
  @counter = session[:counter]
  puts "the counter is #{@counter}."
  @current_question = @survey.questions[@counter]
  @current_options = @current_question.options
  session[:counter] += 1
end

  if request.xhr?
    session[:counter] < @survey.questions.length
      option = Option.find_by_answer(params[:answer])
      Response.create(user_id: session[:user_id], option_id: option.id, question_id: option.question_id)
      { :survey_id => @survey.id, :total_questions => @survey.questions.length, :counter => @counter, :current_question => @current_question, :current_options => @current_options }.to_json
  else
    puts "We are in the ELSE conditional"
    erb :question
  end
end

get '/questions/:id/edit' do  # Step1.) Edit

end

patch '/questions/:id' do  # Step2.) Edit

end

delete '/questions/:id' do  # Delete

end
