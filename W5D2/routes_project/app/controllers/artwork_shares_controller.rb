class ArtworkSharesController < ApplicationController

  def create
    share = ArtworkShare.new(artwork_share_params)
    if share.save 
      render json: share 
    else 
      render json: share.errors.full_messages, status: 422 
    end
  end

  def destroy
    share = ArtworkShare.find_by(id: params[:id])
    if share && share.destroy 
      render plain: 'Share has been destroyed'
    else
      render json: share.errors.full_messages, status: 422
    end

  end

  private
  def artwork_share_params
    params.require(:artwork_share).permit(:artwork_id, :viewer_id)
  end
end
