module Api
  module V1
    # profiles API Controller
    #
    # @example
    #   GET /api/v1/profiles
    #   => { status: 'SUCCESS', data: [...] }
    #
    # @see profiles
    #
    class ProfilesController < ApplicationController
      before_action :set_profile, only: [:show, :update, :destroy]
      # profile一覧を取得
      def index
        profiles = Profiles::FetchAllService.call
        render json: { status: 'SUCCESS', data: profiles }
      end

      def show
        render json: { status: 'SUCCESS', data: @profile }
      end

      def create
        profile = Profile.new(profile_params)
        if profile.save
          render json: { status: 'SUCCESS', data: profile }
        else
          render json: { status: 'ERROR', data: profile.errors }
        end
      end

      def destroy
        @profile.destroy
        render json: { status: 'SUCCESS', message: 'Deleted the profile', data: @profile }
      end

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
