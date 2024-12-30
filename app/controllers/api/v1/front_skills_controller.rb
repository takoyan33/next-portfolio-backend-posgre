module Api
  module V1
    class FrontSkillsController < ApplicationController
      before_action :set_front_skill, only: [:show, :update, :destroy]

      def index
        front_skills = FrontSkill.order(created_at: :desc)
        render json: { status: 'SUCCESS', data: front_skills }
      end

      def show
        render json: { status: 'SUCCESS', message: 'Loaded the front_skill', data: @front_skill }
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
        params.require(:front_skill).permit(:title)
      end
    end
  end
end
