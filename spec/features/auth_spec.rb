require 'rails_helper'

feature 'Login in' do
  before :each do
    @user = FactoryGirl.create(:user)
  end

  it 'user login success' do
    visit new_user_session_path
    fill_in 'Почта', :with => @user.email
    fill_in 'Пароль', :with => @user.password
    click_button('Войти')
    expect(page.current_path).to eq(profile_path)
  end

  it 'user login fail' do
    visit new_user_session_path
    fill_in 'Почта', :with => @user.email
    fill_in 'Пароль', :with => @user.password + "wrong_password"
    click_button('Войти')
    expect(page.current_path).to eq(new_user_session_path)
  end

end