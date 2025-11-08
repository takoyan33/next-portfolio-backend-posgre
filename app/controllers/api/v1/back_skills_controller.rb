module Api
  module V1
    # BackSkills API Controller
    #
    # @example
    #   GET /api/v1/back_skills
    #   => { status: 'SUCCESS', data: [...] }
    #
    # @see BackSkill
    #
    class BackSkillsController < ApplicationController
      before_action :set_back_skill, only: [:show, :update, :destroy]
      # back_skill一覧を取得
      def index
        back_skills = BackSkills::FetchAllService.call
        render json: { status: 'SUCCESS', data: back_skills }
      end

      def show
        render json: { status: 'SUCCESS',  data: @back_skill }
      end

      def create
        back_skill = BackSkill.new(back_skill_params)
        if back_skill.save
          render json: { status: 'SUCCESS', data: back_skill }
        else
          render json: { status: 'ERROR', data: back_skill.errors }
        end
      end

      def destroy
        @back_skill.destroy
        render json: { status: 'SUCCESS', message: 'Deleted the back_skill', data: @back_skill }
      end

      def update
        if @back_skill.update(back_skill_params)
          render json: { status: 'SUCCESS', message: 'Updated the back_skill', data: @back_skill }
        else
          render json: { status: 'SUCCESS', message: 'Not updated', data: @back_skill.errors }
        end
      end

      private

      def set_back_skill
        @back_skill = BackSkill.find(params[:id])
      end

      def back_skill_params
        params.require(:back_skill).permit(:name, :rank, :about, :icon)
      end
    end
  end
end
