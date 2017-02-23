require 'sinatra/base'
require 'rack-flash'

class SongController < ApplicationController
  use Rack::Flash
  enable :sessions


  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    binding.pry
    "Hello World"
    binding.pry
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post '/songs' do
    @genre = Genre.find(params[:genres][0])
    @song = Song.create(params[:song])
    if Artist.exists?(name: params[:artist][:name])
      @artist = Artist.find_by(name: params[:artist][:name])
    else
      @artist = Artist.create(params[:artist])
    end
    @song.artist_id = @artist.id
    @song.save
    SongGenre.create(song_id: @song.id, genre_id: @genre.id)
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end
end
