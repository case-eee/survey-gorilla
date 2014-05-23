get '/surveys' do  # Show all
  @surveys = Survey.all

  erb :all_surveys
end

get '/surveys/new' do  # Step1.) Create

end

post '/surveys' do  # Step2.) Create

end

get '/surveys/:id' do  # Show specific

end

get '/surveys/:id/edit' do  # Step1.) Edit

end

patch '/surveys/:id' do  # Step2.) Edit

end

delete '/surveys/:id' do  # Delete

end

get '/surveys/:id/results' do

end
