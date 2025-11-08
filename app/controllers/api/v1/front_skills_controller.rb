module Api
  module V1
    # frontSkills API Controller
    #
    # @example
    #   GET /api/v1/front_skills
    #   => { status: 'SUCCESS', data: [...] }
    #
    # @see frontSkill
    #
    class FrontSkillsController < ApplicationController
      before_action :set_front_skill, only: [:show, :update, :destroy]
      # front_skill一覧を取得
      def index
        front_skills = FrontSkills::FetchAllService.call
        render json: { status: 'SUCCESS', data: front_skills }
      end

      def show
        render json: { status: 'SUCCESS', data: @front_skill }
      end

      def create
        front_skill = FrontSkill.new(front_skill_params)
        if front_skill.save
          render json: { status: 'SUCCESS', data: front_skill }
        else
          render json: { status: 'ERROR', data: front_skill.errors }
        end
      end

      def destroy
        @front_skill.destroy
        render json: { status: 'SUCCESS', message: 'Deleted the front_skill', data: @front_skill }
      end

      def update
        if @front_skill.update(front_skill_params)
          render json: { status: 'SUCCESS', message: 'Updated the front_skill', data: @front_skill }
        else
          render json: { status: 'SUCCESS', message: 'Not updated', data: @front_skill.errors }
        end
      end

      private

      def set_front_skill
        @front_skill = FrontSkill.find(params[:id])
      end

      def front_skill_params
        params.require(:front_skill).permit( :name, :rank, :about, :icon)
      end
    end
  end
end
