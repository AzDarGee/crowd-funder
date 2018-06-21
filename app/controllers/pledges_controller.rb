class PledgesController < ApplicationController
  def show
    @pledge = Pledge.find(params[:id])
  end
  def create
    @breakpoint = Breakpoint.find(params[:breakpoint_id])
    @pledge = @breakpoint.pledges.build(pledge_params)
    @pledge.user_id = current_user.id
    @pledge.project_id =
  end
  def destroy

  end
  private
  def pledge_params
    params.require(:pledge).permit(:breakpoint_id,:user_id.:project_id)
  end
end
