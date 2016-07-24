class TweetsController < ApplicationController
before_action :set_tweet, only:[:edit,:update,:destroy]

  def index
     @tweets = Tweet.all

  end

  def new
    if params[:back]
      @tweet = Tweet.new(tweets_params)
    else
      @tweet = Tweet.new
  end
end



  def create
     @tweet = Tweet.new(tweets_params)
    if @tweet.save
    redirect_to tweets_path,notice: "ツイートしました！"
else
  render action: 'new'
  end
end

def confirm
    @tweet = Tweet.new(tweets_params)
    render :new if @tweet.invalid?
  end



  def edit
    # edit, update, destroyで共通コード
    #set_tweet で共通化
    # @tweet = Tweet.find(params[:id])
  end


  def update
     # edit, update, destroyで共通コード
         #set_tweet で共通化
    # @tweet = Tweet.find(params[:id])
    if @tweet.update(tweets_params)
     redirect_to tweets_path,notice: "ツイートを編集しました！"
   else
    render action: 'edit'
  end
end


  def destroy

     # edit, update, destroyで共通コード
         #set_tweet で共通化
    # @tweet = Tweet.find(params[:id])

    @tweet.destroy
    redirect_to tweets_path,notice: "ツイートを削除しました！"
  end

private
    def tweets_params
      params.require(:tweet).permit(:content,)
    end
def set_tweet
  @tweet = Tweet.find(params[:id])
end

end




