class UsersController < ApplicationController
  user = User.find(params[:id])
  @name = user.name
  @prototypes = user.prototypes
end
