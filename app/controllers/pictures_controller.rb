class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
    @tags = @picture.tags
  end

  def new
    @picture = Picture.new
  end

  def create

    @picture = Picture.new(allowed_params)
    if @picture.save
      if params[:picture][:avatar].present?
      #   render :crop
      # else
        redirect_to @picture, notice: "Successfully created picture."
      end
    else
      render :new
    end
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    if allowed_params[:tag].present? && allowed_params[:crop_x].present?
      @tag = create_tag(allowed_params)
      if @tag.save
        redirect_to @picture, notice: "Successfully added tag."
      else
        render :crop, notice: "Tag not added."
      end
      return
    end
    @picture = Picture.find(params[:id])
    if @picture.update_attributes(allowed_params)
      if params[:picture][:avatar].present? || params[:picture][:name]
      #   render :crop
      # else
        redirect_to @picture, notice: "Successfully updated picture."
      end
    else
      redirect_to @picture, notice: "Picture not updated."
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to pictures_url, notice: "Successfully destroyed picture."
  end

  def crop
    @picture = Picture.find(params[:id])
    @tag = Tag.new
  end


  private
  
  def allowed_params
    params.require(:picture).permit!
  end

  def create_tag(allowed_params)
    @picture = Picture.find(params[:id])
    @tag = Tag.new(x: allowed_params[:crop_x],
                      y: allowed_params[:crop_y],
                      w: allowed_params[:crop_w],
                      h: allowed_params[:crop_h],
                      name: allowed_params[:tag][:name],
                      text: allowed_params[:tag][:text],
                      link: allowed_params[:tag][:link],
                      picture_id: @picture.id
                      )

    #   "Successfully added tag."
    # else
    #   "Tag not added."
    # end
  end
end
