

class ApplicationController < Sinatra::Base

  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  patch '/songs/:slug' do
    # binding.pry
    @artist = Artist.create(params[:artist])
    @song = Song.find_by_slug(params[:slug])
    @song.artist = @artist
    @song.save
    if params[:song]
      @song.update(params[:song])
    end
    # binding.pry
    # if params.has_key?("genres")
    #   @songgenre = SongGenre.find_by(song_id: @song.id)
    #   SongGenre.update(@songgenre.id, genre_id: params[:genres][0])
    # end
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end

  get '/' do
    erb :index
  end

  get '/songs' do
    @songs = Song.all
    erb :'index/all_songs'
  end

  get '/artists' do
    @artists = Artist.all
    erb :'index/all_artists'
  end

  get '/genres' do
    @genres = Genre.all
    erb :'index/all_genres'
  end
end
