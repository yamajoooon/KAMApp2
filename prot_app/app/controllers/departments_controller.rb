class DepartmentsController < ApplicationController

    before_action :set_current_user
    
    def index

        @department_index = Department.all.order(created_at: :desc)
        @courses = Course.find_by(id: params[:id])
        @add_user_to_groups = AddUserToGroup.where(group_id: params[:id]).pluck(:department_id)

    end

    def add_department_to_group
        @belonging_user = User.where(classname: params[:classname])
        @group_id = params[:group_id]
        @department_id = params[:department_id]

        @belonging_user.each{|user|
            AddUserToGroup.create(user_id: user.id, group_id: @group_id, department_id: @department_id)

        }
        flash[:notice] = "#{params[:classname]}を追加しました"
        redirect_to("/departments/#{@group_id}/index")
    end

end
