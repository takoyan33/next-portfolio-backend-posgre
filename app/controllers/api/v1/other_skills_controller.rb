module Api
  module V1
    # API-032 ～ API-035
    #
    # OtherSkills API Controller
    #
    # API-032
    # GET /api/v1/other_skills
    # その他スキル一覧を取得
    #
    # API-033
    # POST /api/v1/other_skills
    # その他スキルを新規作成
    #
    # API-034
    # GET /api/v1/other_skills/:id
    # その他スキル詳細を取得
    #
    # API-035
    # PATCH /api/v1/other_skills/:id
    # その他スキルを更新
    #
    # ※ DELETE は設計書未記載
    class OtherSkillsController < ApplicationController
      before_action :set_other_skill, only: [:show, :update, :destroy]

      # API-032
      # その他スキル一覧を取得
      def index
        other_skills = OtherSkills::FetchAllService.call
        render json: { status: 'SUCCESS', data: other_skills }
      end

      # API-034
      # その他スキル詳細を取得
      def show
        render json: { status: 'SUCCESS', data: @other_skill }
      end

      # API-033
      # その他スキルを新規作成
      def create
        other_skill = OtherSkill.new(other_skill_params)
        if other_skill.save
          render json: { status: 'SUCCESS', data: other_skill }
        else
          render json: { status: 'ERROR', data: other_skill.errors }
        end
      end

      # API番号なし（設計書未記載）
      # その他スキルを削除
      def destroy
        @other_skill.destroy
        render json: { status: 'SUCCESS', message: 'Deleted the other_skill', data: @other_skill }
      end

      # API-035
      # その他スキルを更新
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
        params.require(:other_skill).permit(:name, :rank, :tag, :about, :icon)
      end
    end
  end
end