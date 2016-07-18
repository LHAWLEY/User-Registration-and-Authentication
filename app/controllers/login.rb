get '/' do

  redirect '/login'
end


get '/login' do

  erb :index
end

post '/login' do
  @user = User.find_by(email: params[:email])
  if @user.authenticate(params[:password], params[:email])
    session[:user_id] = @user.id
    redirect '/users/:id'
  else
    erb :'/users/new'
  end
end

get '/users/:id' do
  if session[:user_id]
    erb :'users/edit'
  else
    redirect :'/users'
  end
end

get '/logout' do
  session.delete(:user_id)
  redirect '/login'
end


