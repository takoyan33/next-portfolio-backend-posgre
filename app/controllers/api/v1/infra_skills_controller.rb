module Api
  module V1
    class InfraSkillsController < ApplicationController
      before_action :set_infra_skill, only: [:show, :update, :destroy]

      def index
        infra_skills = InfraSkill.order(created_at: :desc)
        render json: { status: 'SUCCESS', message:  data: infra_skills }
      end

      def show
        render json: { status: 'SUCCESS', message: 'Loaded the infra_skill', data: @infra_skill }
      end

      def create
        infra_skill = InfraSkill.new(infra_skill_params)
        if infra_skill.save
          render json: { status: 'SUCCESS', data: infra_skill }
        else
          render json: { status: 'ERROR', data: infra_skill.errors }
        end
      end

      def destroy
        @infra_skill.destroy
        render json: { status: 'SUCCESS', message: 'Deleted the infra_skill', data: @infra_skill }
      end

      def update
        if @infra_skill.update(infra_skill_params)
          render json: { status: 'SUCCESS', message: 'Updated the infra_skill', data: @infra_skill }
        else
          render json: { status: 'SUCCESS', message: 'Not updated', data: @infra_skill.errors }
        end
      end

      private

      def set_infra_skill
        @infra_skill = InfraSkill.find(params[:id])
      end

      def infra_skill_params
        params.require(:infra_skill).permit(:title)
      end
    end
  end
end
