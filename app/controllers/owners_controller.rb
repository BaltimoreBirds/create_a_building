class OwnersController < ApplicationController

  def new
    @owner= Owner.new
  end

  def create
    @owner = Owner.new(owner_params)

    respond_to do |format|
      if @owner.save
       format.html { redirect_to new_owner_path, notice: "The owner was created successfully." }
      else
        format.html { render action: 'new' }
      end
    end
  end

private
  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :email)
  end

end
