class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

def index
	@tweets = Tweet.all
end

def new
	@tweet = Tweet.new
end

def create
	@tweet = Tweet.new tweet_params
	if @tweet.save
		redirect_to @tweet
	else
		redirect_to new_tweet_path
	end
end

def edit
end

def update
	if @tweet.update_attributes(tweet_params)
		redirect_to @tweet
	else
		redirect_to edit_tweet_path
	end
end

  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: 'Tweet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

def show
end

private
	def set_tweet
		@tweet = Tweet.find(params[:id])
	end

	def tweet_params
		params.require(:tweet).permit(:username, :content)
	end

end
