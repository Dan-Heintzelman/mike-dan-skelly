#Before route examples:

# before '/posts/:id/comments/*' do
#   redirect '/session/new' unless logged_in?
# end

# before '/posts/new' do
#   redirect '/session/new' unless logged_in?
# end

get "/" do
	redirect '/posts'
end

get "/posts" do
   erb :"posts/index"
end

get "/posts/new" do
  erb :"posts/new"
end

post "/posts" do
  newpost = Post.new(title: params[:title], article_url: params[:article_url], user: current_user)
  if newpost.save
    redirect '/posts'
  else
    @errors = newpost.errors.full_messages
    erb :"posts/new"
  end
end

get "/posts/:id/comments/new" do
  @post = Post.find(params[:id])
  erb :"comments/new"
end


get "/posts/:id" do
  @post = Post.find(params[:id])
  @comments = @post.comments
	erb :"posts/show"
end



get '/posts/:id/edit' do

  #get params from url
  @post = Post.find(params[:id]) #define intstance variable for view

  erb :'posts/edit' #show edit post view

end

put '/posts/:id' do

  #get params from url
  @post = Post.find(params[:id]) #define variable to edit

  @post.attributes = params[:post] #assign new attributes

  if @post.save? #saves new post or returns false if unsuccessful
    redirect "/posts/#{@post.id}" #redirect back to posts index page
  else
    erb :'posts/edit' #show edit post view again(potentially displaying errors)
  end

end


get '/posts/:id/edit' do

  #get params from url
  @post = Post.find(params[:id]) #define intstance variable for view

  erb :'posts/edit' #show edit post view

end




post "/posts/:id/comments" do
  @post = Post.find(params[:id])
  @comment = @post.comments.new(text: params[:comment])
  if @comment.save
    redirect "/posts/#{@post.id}"
  else
    @errors = @comment.errors.fullmessages
    erb :"comments/new"
  end
end

put '/posts/:post_id/comments/:id' do

  @post = Post.find(params[:post_id])

  @comment = @post.comments.find(params[:id])

  if @comment.update(text: params[:comment])
    redirect "/posts/#{@post.id}"
  else
    erb :'comments/edit' #show edit comments view again(potentially displaying errors)
  end

end

get '/posts/:post_id/comments/:id/edit' do

  @post = Post.find(params[:post_id])

  @comment = @post.comments.find(params[:id])

  erb :'comments/edit'

end





delete '/posts/:id' do
  puts "@@@@@@@@@@@@@@@@"
  #get params from url
  @post = Post.find(params[:id]) #define post to delete

  @post.destroy #delete post

  redirect "/posts" #redirect back to posts index page

end

delete '/posts/:post_id/comments/:id' do

  @post = Post.find(params[:post_id])
  @comment = @post.comments.find(params[:id])
  @comment.destroy

  redirect "/posts/#{@post.id}"

end
