class ArtworksController < ApplicationController

  def index 
    # artworks = Artwork.all 
    # render plain: 'Artworks index'
    # render json: artworks
    if params[:user_id]
      render json: Artwork.artworks_by_user_id(params[:user_id])
    else 
      render json: Artwork.all 
    end
  end

  def show
    artwork = Artwork.find_by(id: params[:id])
    if artwork
      render json: artwork
    else
      render plain: 'NO ARTWORK WITH SPECIFIED ID!!!!! >:('
    end
  end

  def create
    artwork = Artwork.new(artwork_params)

    if artwork.save 
      render json: artwork 
    else 
      render json: artwork.errors.full_messages, status: 422 
    end
  end

  def update
    artwork = Artwork.find_by(id: params[:id])

    if artwork && artwork.update(artwork_params)
      render json: artwork 
    else  
      render json: artwork.errors.full_messages, status: 422
    end
  end

  def destroy 
    artwork = Artwork.find_by(id: params[:id])

    if artwork && artwork.destroy 
      render plain: 'Artwork has been destroyed!!!'
    else 
      render plain: 'No artwork with that id.'
    end
  end

  private
  def artwork_params
    params.require(:artwork).permit(:title, :img_url, :artist_id)
  end
end
