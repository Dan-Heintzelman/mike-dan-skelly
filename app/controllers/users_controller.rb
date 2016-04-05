#Get new register page

get '/users/new' do
	erb :"users/new"
end

#Get user profile page

get '/users/:id' do
  @user = User.find(params[:id]);
  erb :"users/show"
end

#Create new user

post '/users' do
	user = User.new(username: params[:username], password: params[:password])
  if user.save
    session[:user_id] = user.id
    redirect "/"
  else
    @errors = user.errors.full_messages
    erb :"users/new"
  end
end
