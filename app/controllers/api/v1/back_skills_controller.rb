module Api
  module V1
    class BackSkillsController < ApplicationController
      before_action :set_back_skill, only: [:show, :update, :destroy]

      def index
        back_skills = BackSkill.order(created_at: :desc)
        render json: { status: 'SUCCESS', data: back_skills }
      end

      def show
        render json: { status: 'SUCCESS', message: 'Loaded the back_skill', data: @back_skill }
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
        params.require(:back_skill).permit(:title)
      end
    end
  end
end
