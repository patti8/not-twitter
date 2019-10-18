class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(params_tweet)
    if @tweet.save!
      flash[:notice] = "Create new tweet successfully"
      redirect_to @tweet
    else
      render 'new'
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    if @tweet.destroy!
      flash[:notice] = "successfully delete"
      redirect_to tweets_path
    end
  end

  private
    def params_tweet
      params.require(:tweet).permit(:tweet)
    end

end
