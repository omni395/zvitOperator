module UsersHelper

  # Показывает полное имя пользователя (ФИО) если есть
  def user_full_name
    if @user.last_name != nil
      last_name = @user.last_name
    else
      last_name = ''
    end
    if @user.first_name != nil
      first_name = @user.first_name
    else
      first_name = ''
    end
    if @user.middle_name != nil
      middle_name = @user.middle_name
    else
      middle_name = ''
    end
    render inline: (last_name + ' ' + first_name + ' ' + middle_name)
  end

end