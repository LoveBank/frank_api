class LinkProfilesController < ApplicationController
  before_action :set_link_profile, only: [:show, :update, :destroy]

  # GET /link_profiles/1
  # GET /link_profiles/1.json
  def show
    render json: @link
  end

  # POST /link_profiles
  # POST /link_profiles.json
  def create
    owning_profile = Profile.find_by_email(params[:link[:email]])
    to_profile = Profile.find_by_email(params[:link[:to_email]])

    owning_profile << to_profile

    if owning_profile.save
      render json: @link, status: :created, location: @link
    else
      render json: @link.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /link_profiles/1
  # PATCH/PUT /link_profiles/1.json
  def update
    @link = Link.find(params[:id])

    if @link.update(link_profile_params)
      head :no_content
    else
      render json: @link.errors, status: :unprocessable_entity
    end
  end

  # DELETE /link_profiles/1
  # DELETE /link_profiles/1.json
  def destroy
    @link.destroy

    head :no_content
  end

  private

    def set_link_profile
      @link = Link.find(params[:id])
    end

    def link_profile_params
      params[:link]
    end
end
