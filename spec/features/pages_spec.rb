require 'rails_helper'

feature 'main page' do
  it 'can visit' do
    visit root_path
    expect(page).to have_text('Павел Щеглов')
    expect(page).to have_text('+7 (915) 0 300 200')
  end
end