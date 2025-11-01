module Api
  module V1
    # otherSkills API Controller
    #
    # @example
    #   GET /api/v1/other_skills
    #   => { status: 'SUCCESS', data: [...] }
    #
    # @see otherSkill
    #
    class OtherSkillsController < ApplicationController
      before_action :set_other_skill, only: [:show, :update, :destroy]
      # otherSkill一覧を取得
      def index
        other_skills = OtherSkills::FetchAllService.call
        render json: { status: 'SUCCESS', data: other_skills }
      end

      def show
        render json: { status: 'SUCCESS', data: @other_skill }
      end

      def create
        other_skill = OtherSkill.new(other_skill_params)
        if other_skill.save
          render json: { status: 'SUCCESS', data: other_skill }
        else
          render json: { status: 'ERROR', data: other_skill.errors }
        end
      end

      def destroy
        @other_skill.destroy
        render json: { status: 'SUCCESS', message: 'Deleted the other_skill', data: @other_skill }
      end

      def update
        if @other_skill.update(other_skill_params)
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
