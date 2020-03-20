# frozen_string_literal: true

class CandidatesController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    params[:candidate][:group_id] = @group.id
    @candidate = Candidate.create(candidate_params)
  end

  private

  def candidate_params
    params.require(:candidate).permit(:name, :group_id)
  end
end
