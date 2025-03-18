module Api
  module V1
    class InfraSkillsController < BaseController
      before_action :set_infra_skill, only: [:show, :update, :destroy]

      def index
        infra_skills = cached_response("infra_skills") do
          InfraSkill.order(created_at: :desc).to_a
        end
        render json: { status: 'SUCCESS', data: infra_skills }
      end

      def show
        @infra_skill = cached_response("infra_skill/#{params[:id]}") do
          InfraSkill.find(params[:id])
        end
        render json: { status: 'SUCCESS', message: 'Loaded the infra_skill', data: @infra_skill }
      end

      def create
        infra_skill = InfraSkill.new(infra_skill_params)
        if infra_skill.save
          Rails.cache.delete("infra_skills")
          render json: { status: 'SUCCESS', data: infra_skill }
        else
          render json: { status: 'ERROR', data: infra_skill.errors }
        end
      end

      def destroy
        @infra_skill.destroy
        Rails.cache.delete("infra_skills")
        Rails.cache.delete("infra_skill/#{params[:id]}")
        render json: { status: 'SUCCESS', message: 'Deleted the infra_skill', data: @infra_skill }
      end

      def update
        if @infra_skill.update(infra_skill_params)
          Rails.cache.delete("infra_skills")
          Rails.cache.delete("infra_skill/#{params[:id]}")
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
