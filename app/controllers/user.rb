before '/user/*' do
	#DOES THIS EVEN DO ANYTHING?
	if session[:user_id] != (User.find(session[:user_id])).id
		redirect '/' #return to root because you are not supposed to be here
	end
end

get '/user/home' do
  @surveys = Survey.all.sample(10)
  @authored_surveys = current_user.authored_surveys
	erb :user_home
end

get '/user/logout' do
	session.clear
	redirect to '/'
end
