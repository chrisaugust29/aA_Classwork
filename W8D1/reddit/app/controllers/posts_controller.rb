class PostsController < ApplicationController

    before_action 

    def new 
        @post = Post.new
        render :new
    end 

    def create
        @post = Post.new(post_params)
        @post.author_id = current_user.id

        if @post.save
            redirect_to post_url(@post)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :new
        end


    def show 
        @post = Post.find_by(params[:id])
    end

    def edit
        @post = Post.find_by(params[:id])
    end

    def update 
       @post = Post.find_by(params[:id])
       if @post.update(post_params)
        redirect_to post_url(@post)
       else
         flash.now[:errors] = @post.errors.full_messages
         render :edit
       end
    end

    def destroy
         @post = Post.find_by(params[:id])
         post_sub = @post.sub_id 
         if @post.destroy
            redirect_to sub_url(post_sub)
         else
            flash.now[:errors] =["God Post cannot be deleted"]
         end
    end

    private 
    def post_params
        params.require(:post).permit(:title, :url, :content, :sub_id, :author_id)
    end


end
