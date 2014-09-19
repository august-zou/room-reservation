module ApplicationHelper
    # reservation_form
    def get_reservation_form_url
        if @reservation_record.persisted?
          reservation_path(@reservation_record) 
        else
          reservations_path
        end
    end
    # admin_user_form
    def get_admin_user_form_url
        if @user.persisted?
          admin_user_path(@user) 
        else
          admin_users_path
        end
    end

    def get_admin_room_form_url
        if @room.persisted?
          admin_room_path(@room) 
        else
          admin_rooms_path
        end
    end
end
