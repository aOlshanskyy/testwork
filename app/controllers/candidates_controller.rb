# frozen_string_literal: true

class CandidatesController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    @candidate = Candidate.create(candidate_params)
    redirect_to group_path(@group)
  end

  private

  def candidate_params
    params.require(:candidate).permit(:name, :group_id)
  end
end
