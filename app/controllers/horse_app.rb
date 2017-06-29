class HorseApp < Sinatra::Base
  get '/horses' do
    @horses = Horse.all
    erb :"horses/index"
  end

  get '/horses/new' do
    erb :"horses/new"
  end

  post '/horses' do
    @horse = Horse.create(params[:horse])
    redirect '/horses'
  end

  get '/horses/:id' do |id|
    @horse = Horse.find(id)
    erb :"horses/show"
  end

  get '/horses/:id/edit' do
    @horse = Horse.find(params[:id])
    erb :"horses/edit"
  end

  put '/horses/:id' do |id|
    Horse.update(id.to_i, params[:horse])
    redirect "/horses/#{id}"
  end

  delete '/horses/:id' do |id|
    Horse.destroy(id.to_i)
    redirect '/horses'
  end

  get '/jockeys' do
    @jockeys = Jockey.all
    erb :"jockeys/index"
  end

  get '/breeds' do
    @breeds = Breed.all
    erb :"breeds/index"
  end

  get '/jockeys/:id' do |id|
    @jockey = Jockey.find(id)
    erb :"jockeys/show"
  end

end
