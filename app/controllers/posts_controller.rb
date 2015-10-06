class PostsController < ApplicationController

# the index allows me to view a list of posts on one page
  def index
    @posts = Post.all
    binding.pry
    if current_user.saved_preference
      @saved_preference = current_user.saved_preference
    else
      @saved_preference = SavedPreference.new
    end
  end

# the show allows me to view the details of every post
# the "find param..." helps locate the post in the database by its ID
  def show
  @post = Post.find(params[:id])
  end

# the "find.params.." is not under the new method because the new method create a new post without accessing the database.
  def new
    @post = Post.new
  end

  def edit
  @post = Post.find(params[:id])
  end

# the create is to save the new post
  def create
  #render plain: params[:post].inspect
  # to display the paramerters that are coming in the form

  #  @post = Post.new(params.require(:post).permit(:title, :text))
  @post = Post.new(posts_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end


  def update

  @post =  Post.find(params[:id])
  if @post.update(posts_params)
    redirect_to @post
  else
    render 'edit'
  end
  end


  def destroy

  @post = Post.find(params[:id])
  @post.destroy
  redirect_to posts_path

  end




  private
  def posts_params
  params.require(:post).permit(:title, :text)
  end

end
