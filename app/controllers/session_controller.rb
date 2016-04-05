get '/'  do
  erb "Yo"
end


# Get form to Login to a new session

get '/session/new' do
 	erb :"session/new"
end

# Login to a new session.

post '/session' do
  user = User.find_by(username: params[:username])
  if user && user.authenticate?(params[:password])
      session[:user_id]=user.id
      redirect '/'
  else
    @error = "There was a problem logging in."
    erb :"session/new"
  end
end

get '/logout' do
	session.delete(:user_id)
  redirect "/"
end

#for debugging - remove before publishing live

get '/session-viewer' do
  session.inspect
end