module Api
  module V1
    # API-036 ～ API-039
    #
    # Profiles API Controller
    #
    # API-036
    # GET /api/v1/profiles
    # プロフィール一覧を取得
    #
    # API-037
    # POST /api/v1/profiles
    # プロフィールを新規作成
    #
    # API-038
    # GET /api/v1/profiles/:id
    # プロフィール詳細を取得
    #
    # API-039
    # PATCH /api/v1/profiles/:id
    # プロフィールを更新
    #
    # ※ DELETE は設計書未記載
    class ProfilesController < ApplicationController
      before_action :set_profile, only: [:show, :update, :destroy]

      # API-036
      # プロフィール一覧を取得
      def index
        profiles = Profiles::FetchAllService.call
        render json: { status: 'SUCCESS', data: profiles }
      end

      # API-038
      # プロフィール詳細を取得
      def show
        render json: { status: 'SUCCESS', data: @profile }
      end

      # API-037
      # プロフィールを新規作成
      def create
        profile = Profile.new(profile_params)
        if profile.save
          render json: { status: 'SUCCESS', data: profile }
        else
          render json: { status: 'ERROR', data: profile.errors }
        end
      end

      # API番号なし（設計書未記載）
      # プロフィールを削除
      def destroy
        @profile.destroy
        render json: { status: 'SUCCESS', message: 'Deleted the profile', data: @profile }
      end

      # API-039
      # プロフィールを更新
      def update
        if @profile.update(profile_params)
          render json: { status: 'SUCCESS', message: 'Updated the profile', data: @profile }
        else
          render json: { status: 'SUCCESS', message: 'Not updated', data: @profile.errors }
        end
      end

      private

      def set_profile
        @profile = Profile.find(params[:id])
      end

      def profile_params
        params.require(:profile).permit(:content, :hobby, :license)
      end
    end
  end
end