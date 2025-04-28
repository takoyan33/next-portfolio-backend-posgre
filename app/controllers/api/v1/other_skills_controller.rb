module Api
  module V1
    class OtherSkillsController < BaseController
      before_action :set_other_skill, only: [:show, :update, :destroy]

      def index
        other_skills = cached_response("other_skills") do
          OtherSkill.order(created_at: :desc).to_a
        end
        render json: { status: 'SUCCESS', data: other_skills }
      end

      def show
        @other_skill = cached_response("other_skill/#{params[:id]}") do
          OtherSkill.find(params[:id])
        end
        render json: { status: 'SUCCESS', data: @other_skill }
      end

      def create
        other_skill = OtherSkill.new(other_skill_params)
        if other_skill.save
          Rails.cache.delete("other_skills")
          render json: { status: 'SUCCESS', data: other_skill }
        else
          render json: { status: 'ERROR', data: other_skill.errors }
        end
      end

      def destroy
        @other_skill.destroy
        Rails.cache.delete("other_skills")
        Rails.cache.delete("other_skill/#{params[:id]}")
        render json: { status: 'SUCCESS', message: 'Deleted the other_skill', data: @other_skill }
      end

      def update
        if @other_skill.update(other_skill_params)
          Rails.cache.delete("other_skills")
          Rails.cache.delete("other_skill/#{params[:id]}")
          render json: { status: 'SUCCESS', message: 'Updated the other_skill', data: @other_skill }
        else
          render json: { status: 'SUCCESS', message: 'Not updated', data: @other_skill.errors }
        end
      end

      private

      def set_other_skill
        @other_skill = OtherSkill.find(params[:id])
      end

      def other_skill_params
        params.require(:other_skill).permit(:title)
      end
    end
  end
end
