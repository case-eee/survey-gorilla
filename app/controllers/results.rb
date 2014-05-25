get '/surveys/:survey_id/results' do  # Show all
  @survey = Survey.find(params[:survey_id])
  @questions = Question.where(survey_id: @survey.id)
  erb :show_results
end

get '/<plural model>/new' do  # Step1.) Create

end

post '/<plural model>' do  # Step2.) Create

end

get '/<plural model>/:id' do  # Show specific

end

get '/<plural model>/:id/edit' do  # Step1.) Edit

end

patch '/<plural model>/:id' do  # Step2.) Edit

end

delete '/<plural model>/:id' do  # Delete

end
