# app/controllers/concerns/tagable_controller.rb
module TagableController
    extend ActiveSupport::Concern

    included do
      before_action :set_tagable, only: [:edit, :update, :destroy]
    end

    def edit
      @tag = @tagable.build_tag if @tagable.tag.nil?
    end

    def update
      if @tagable.update(tagable_params)
        redirect_to @tagable, notice: "#{@tagable.class.name} was successfully updated."
      else
        render :edit
      end
    end

    private

    def set_tagable
      @tagable = controller_name.classify.constantize.find(params[:id])
    end

    def tagable_params
      params.require(controller_name.singularize).permit(tag_attributes: [:id, :label, :service])
    end
  end
