require 'rails_helper'

RSpec.describe User, type: :model do

  before { @user = FactoryGirl.create(:user) }

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  # Фиг его знает как это делается
  # Пользователь должен получить роль при регистрации

  #it 'Has role?' do
  #  expect(@user.role).not_to be_nil
  #end

  # Первый зарегистрированный пользователь получает права администратора (role - admin)
  #it 'First user is admin?' do
  #  expect(@user.role.name).to eq(@admin.name)
  #end
  # Остальные пользователи получают роль пользователя (role - registered)

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  # Не переводит в нижний регистр при сохранении ????????
  # Данные пользователя сохраняются в базу как downcase
  describe 'has a downcase format' do
    let(:mixed_first_name) {'UsEr'}
    let(:mixed_last_name) {'UsErOv'}
    let(:mixed_middle_name) {'UsErOvIcH'}

    it '#first_name' do
      @user.first_name = mixed_first_name
      @user.save
      expect(@user.first_name).to eq mixed_first_name.downcase
    end
    it '#last_name' do
      @user.last_name = mixed_last_name
      @user.save
      expect(@user.last_name).to eq mixed_last_name.downcase
    end
    it '#middle_name' do
      @user.middle_name = mixed_middle_name
      @user.save
      expect(@user.middle_name).to eq mixed_middle_name.downcase
    end
  end

  # Максимальная длинна полей имени 30 символов
  describe 'has max length 30 in field:' do
    it '#user_name' do
      @user.user_name = "a" * 31
      expect(@user).not_to be_valid
    end
    it '#first_name' do
      @user.first_name = "a" * 31
      expect(@user).not_to be_valid
    end
    it '#last_name' do
      @user.last_name = "a" * 31
      expect(@user).not_to be_valid
    end
    it '#middle_name' do
      @user.middle_name = "a" * 31
      expect(@user).not_to be_valid
    end
  end
end
