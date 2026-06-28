module Api
  module V1
    # API-028 ～ API-031
    #
    # InfraSkills API Controller
    #
    # API-028
    # GET /api/v1/infra_skills
    # インフラスキル一覧を取得
    #
    # API-029
    # POST /api/v1/infra_skills
    # インフラスキルを新規作成
    #
    # API-030
    # GET /api/v1/infra_skills/:id
    # インフラスキル詳細を取得
    #
    # API-031
    # PATCH /api/v1/infra_skills/:id
    # インフラスキルを更新
    #
    # ※ DELETE は設計書未記載
    class InfraSkillsController < ApplicationController
      before_action :set_infra_skill, only: [:show, :update, :destroy]

      # API-028
      # インフラスキル一覧を取得
      def index
        infra_skills = InfraSkills::FetchAllService.call
        render json: { status: 'SUCCESS', data: infra_skills }
      end

      # API-030
      # インフラスキル詳細を取得
      def show
        render json: { status: 'SUCCESS', data: @infra_skill }
      end

      # API-029
      # インフラスキルを新規作成
      def create
        infra_skill = InfraSkill.new(infra_skill_params)
        if infra_skill.save
          render json: { status: 'SUCCESS', data: infra_skill }
        else
          render json: { status: 'ERROR', data: infra_skill.errors }
        end
      end

      # API番号なし（設計書未記載）
      # インフラスキルを削除
      def destroy
        @infra_skill.destroy
        render json: { status: 'SUCCESS', message: 'Deleted the infra_skill', data: @infra_skill }
      end

      # API-031
      # インフラスキルを更新
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
        params.require(:infra_skill).permit(:name, :rank, :tag, :about, :icon)
      end
    end
  end
end