class Admin::PostsController < ApplicationController
  access_control do
      allow :admin, :all
  end
  
  layout "inadmin" 

  uses_tiny_mce :options => {
                              :theme => 'advanced',
                              :theme_advanced_resizing => true,
                              :theme_advanced_resize_horizontal => false,
                              :theme_advanced_buttons1 => %w{ newdocument | bold italic underline strikethrough | justifyleft justifycenter justifyright justifyfull styleselect formatselect fontselect fontsizeselect },
                              :theme_advanced_buttons2 => %w{ cut copy paste pastetext pasteword | search replace | bullist numlist | outdent indent blockquote | undo redo | link unlink anchor image cleanup help code | insertdate inserttime preview | forecolor backcolor},
                              :theme_advanced_buttons3 => %w{ tablecontrols | hr removeformat visualaid | sub sup | charmap emotions iespell media advhr | print | ltr rtl | fullscreen},
                              :theme_advanced_buttons4 => %w{ insertlayer moveforward movebackward absolute | styleprops | cite abbr acronym del ins attribs | visualchars nonbreaking pagebreak},
                              #:plugins => %w{ table fullscreen }
                              :plugins => %w{ safari pagebreak style layer table save advhr advimage advlink emotions iespell inlinepopups insertdatetime preview media searchreplace print contextmenu paste directionality fullscreen noneditable visualchars nonbreaking xhtmlxtras template},
                              :width =>"100%",
                            	:height =>"400"
                            }  
 

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to [:admin, @post], :notice => "Successfully created post."
    else
      render :action => 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to [:admin, @post], :notice  => "Successfully updated post."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_url, :notice => "Successfully destroyed post."
  end
end
