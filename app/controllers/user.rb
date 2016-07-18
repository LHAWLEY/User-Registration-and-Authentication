get '/session-viewer' do
  session.inspect
end

get '/users' do
  redirect '/users/new' unless session[:user_id]

  session[:user_views] = 0 unless session[:user_views]
  session[:user_views] += 1

  erb :'/index'
end

get '/users/new' do

  erb :'/users/new'
end

post '/users' do
  @user = User.new(params[:user])

  if @user.save
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :'/users/new'
  end
end

get '/users/:id' do

   erb :'users/edit'
end


