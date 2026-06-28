module Api
  module V1
    # API-024 ～ API-027
    #
    # BackSkills API Controller
    #
    # API-024
    # GET /api/v1/back_skills
    # バックエンドスキル一覧を取得
    #
    # API-025
    # POST /api/v1/back_skills
    # バックエンドスキルを新規作成
    #
    # API-026
    # GET /api/v1/back_skills/:id
    # バックエンドスキル詳細を取得
    #
    # API-027
    # PATCH /api/v1/back_skills/:id
    # バックエンドスキルを更新
    #
    # ※ DELETE は設計書未記載
    class BackSkillsController < ApplicationController
      before_action :set_back_skill, only: [:show, :update, :destroy]

      # API-024
      # バックエンドスキル一覧を取得
      def index
        back_skills = BackSkills::FetchAllService.call
        render json: { status: 'SUCCESS', data: back_skills }
      end

      # API-026
      # バックエンドスキル詳細を取得
      def show
        render json: { status: 'SUCCESS', data: @back_skill }
      end

      # API-025
      # バックエンドスキルを新規作成
      def create
        back_skill = BackSkill.new(back_skill_params)
        if back_skill.save
          render json: { status: 'SUCCESS', data: back_skill }
        else
          render json: { status: 'ERROR', data: back_skill.errors }
        end
      end

      # API番号なし（設計書未記載）
      # バックエンドスキルを削除
      def destroy
        @back_skill.destroy
        render json: { status: 'SUCCESS', message: 'Deleted the back_skill', data: @back_skill }
      end

      # API-027
      # バックエンドスキルを更新
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
        params.require(:back_skill).permit(:name, :rank, :tag, :about, :icon)
      end
    end
  end
end