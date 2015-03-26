require 'byebug'

get '/' do
  # Look in app/views/index.erb
  erb :index
end

#sign in
post '/sign_in' do
  @blogger = Post.authenticate(params[:email], params[:password])
byebug
  if @blogger
    session[:user_id] = @blogger.id
    byebug
    redirect to '/posts_list'
  else
    session[:error] = "Invalid username or password."
    redirect to '/' #ok, tried testing..this is working means that the /posts_list isnt working
  end
end

get '/posts_list' do
  @user = User.find(session[:user_id])
  byebug
  @posts = @user.posts.all
  byebug
  # computer cannot process the @posts = @user.posts.all, tried debugging
  erb :posts_list
  # end
end

#create an account route
get '/create_account' do
  erb :create_account
end

#Daniel, explain in assessment that this sign-up is to allow creation of new user into User table, which is redirected to log-in page once more
post '/sign_up' do
  @user_account = User.create(params[:user])
  erb :index
end

get '/sign_out' do
  session.delete("dummy_id")
  erb :sign_out
end

get '/new_post' do
  erb :new_post
end

post '/new_post' do
  @posting = Post.create(title: params[:title], body: params[:body], user_id: session[:user_id])
  @tag = Tag.create(name: params[:post])
  redirect to("/posts_list")
end

get '/:id/edit' do
  @post = Post.find(params[:id])
  erb :edit_post
end

post '/:id/edit' do
  @post = Post.find(params[:id])
  byebug
  @post.update_attributes(params[:post])
  # @tag = Tag.create(name: params[:post])
  redirect to("/posts_list")
end

