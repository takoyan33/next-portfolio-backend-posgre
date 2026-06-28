module Api
  module V1
    # API-020 ～ API-023
    #
    # FrontSkills API Controller
    #
    # API-020
    # GET /api/v1/front_skills
    # フロントエンドスキル一覧を取得
    #
    # API-021
    # POST /api/v1/front_skills
    # フロントエンドスキルを新規作成
    #
    # API-022
    # GET /api/v1/front_skills/:id
    # フロントエンドスキル詳細を取得
    #
    # API-023
    # PATCH /api/v1/front_skills/:id
    # フロントエンドスキルを更新
    #
    # ※ DELETE は設計書未記載
    class FrontSkillsController < ApplicationController
      before_action :set_front_skill, only: [:show, :update, :destroy]

      # API-020
      # フロントエンドスキル一覧を取得
      def index
        front_skills = FrontSkills::FetchAllService.call
        render json: { status: 'SUCCESS', data: front_skills }
      end

      # API-022
      # フロントエンドスキル詳細を取得
      def show
        render json: { status: 'SUCCESS', data: @front_skill }
      end

      # API-021
      # フロントエンドスキルを新規作成
      def create
        front_skill = FrontSkill.new(front_skill_params)
        if front_skill.save
          render json: { status: 'SUCCESS', data: front_skill }
        else
          render json: { status: 'ERROR', data: front_skill.errors }
        end
      end

      # API番号なし（設計書未記載）
      # フロントエンドスキルを削除
      def destroy
        @front_skill.destroy
        render json: { status: 'SUCCESS', message: 'Deleted the front_skill', data: @front_skill }
      end

      # API-023
      # フロントエンドスキルを更新
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
        params.require(:front_skill).permit(:name, :rank, :tag, :about, :icon)
      end
    end
  end
end