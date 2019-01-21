class TagsController < ApplicationController
  before_action :set_tags
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  # GET pictures/1/tags
  def index
    @tags = @picture.tags
    @uniq_tags = @tags.order('name').group('name')
  end

  # GET pictures/1/tags/1
  def show
    @tags = @picture.tags.where(name: @tag.name).where.not(id: @tag.id)
    @pictures_with_tag = Picture.joins(:tags).where(tags: { name: @tag.name }).
                                  where.not(pictures: {name: @picture.name}).group('pictures.id')
  end

  # GET pictures/1/tags/new
  def new
    @tag = @picture.tags.build
  end

  # GET pictures/1/tags/1/edit
  def edit
  end

  # POST pictures/1/tags
  def create
    @tag = @picture.tags.build(tag_params)

    if @tag.save
      redirect_to([@tag.picture, @tag], notice: 'Tag was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT pictures/1/tags/1
  def update
    binding.pry
    if @tag.update_attributes(tag_params)
      redirect_to([@tag.picture, @tag], notice: 'Tag was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE pictures/1/tags/1
  def destroy
    @tag.destroy

    redirect_to picture_tags_url(@picture)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tags
      @picture = Picture.find(params[:picture_id])
    end

    def set_tag
      @tag = @picture.tags.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tag_params
      params.require(:tag).permit(:name, :text, :link, :x, :y, :w, :h, :picture_id)
    end
end
