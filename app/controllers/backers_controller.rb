class BackersController < ApplicationController
  def new
    @backer = Backer.new
  end
  def create
    @backer = Backer.new(backer_params)
    if @backer.save
      redirect_to root_path, flash: { notice: "#{@backer.name} signed up. Start backing some projects!" }
    else
      flash.now[:alert] = 'Something went wrong, try again!'
      render :new
    end
  end
  def destroy
    @backer = Backer.find(params[:id])
    @backer.destroy
    redirect_to root_path, flash: { notice: 'Account deleted!' }
  end
  def backer_params
    params.require(:backer).permit(:name,:email,:password,:password_digest)
  end
end
