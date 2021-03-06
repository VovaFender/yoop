class TracksController < ApplicationController
  before_filter :login_required, :except => [:index, :show]

  def index
    for artist in Track.all
      artist.tracks
    end
  end

  def show
    @track = Track.find(params[:id])
  end

  def new
    @track = Track.new
  end

  def create
    @track = Track.new(params[:track])
    if @track.save
      redirect_to @track, :notice => "Successfully created track."
    else
      render :action => 'new'
    end
  end

  def edit
    @track = Track.find(params[:id])
  end

  def update
    @track = Track.find(params[:id])
    if @track.update_attributes(params[:track])
      redirect_to artist_path($key), :notice  => "Successfully updated track."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy
    redirect_to artist_path($key.id), :notice => "Successfully deleted track."
  end
end
