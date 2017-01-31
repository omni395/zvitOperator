# README


 **`Development:`**
 
* За день - Сумма пополнения
* За день - Новое подключение, если было
* За день - Адрес и фамилия клиента на пополение или для нового подключения
* За день - Непредвиденные расходы (описание и суммма)

* Не актуально для данной реализации - Два клиента с разными фамилиями могут быть на одном адресе
* Не актуально для данной реализации - Один клиент может иметь несколько подключений на разных адресах

* За день - должна считаться общая сумма пополнившихся клиентов и новых клиентов
* Сделать разбивку по затратам на новое подключение (кабель за метр - 4 грн., муфта - 10 грн., клипса - 10 грн., данные для подключения - 5 грн.)
* Указать общий метраж кабеля, количество муфт, клипс и распечаток. Остальное считается автоматом.

* За неделю - Общая сумма по пополнениям и подключениям (количество пополений и количество новых подключений).
* За неделю - Считается 5% от общей суммы за неделю и отнимается от общей суммы.

****
 **`Tests:`**

 * Need to find out how to create tests when the user had role when registered.
 * Need to find out how to create tests when the First user received role Admin.
 * Need to find out how to create tests when any registered users received roles 'registered'
 * Написать тесты для проверки перевода ФИО пользователя в нормальный (с большой буквы) регистр.
 * 
 
 ****


      - if user_signed_in?
        %li.nav-item.dropdown
          %a#navbarDropdownMenuLink.nav-link.dropdown-toggle{"aria-expanded" => "false", "aria-haspopup" => "true", "data-toggle" => "dropdown", :href => user_path(current_user)}
            = current_user.email
          .dropdown-menu{"aria-labelledby" => "navbarDropdownMenuLink"}
            - if can? :manage, Rails_admin
              .dropdown-item
                = link_to 'Админка', rails_admin_path, class: 'btn'
            .dropdown-divider
            .dropdown-item
              = link_to 'Выход', destroy_user_session_path, :method => 'delete', class: 'btn'
      - else
        .dropdown-item
          = link_to 'Вход', new_user_session_path
        .dropdown-item
          = link_to 'Регистрация', new_user_registration_path