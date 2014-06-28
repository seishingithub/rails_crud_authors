require 'spec_helper'

feature 'User can CRUD authors' do
  scenario 'User can create and view authors in list' do
    visit '/'
    expect(page).to have_content 'Welcome'
    click_on 'Add Author'
    fill_in 'Name', with: 'Jean Auel'
    fill_in 'Title', with: 'The Clan of the Cave Bear'
    click_on 'Create Author'
    expect(page).to have_content 'Jean Auel'
    expect(page).to have_content 'The Clan of the Cave Bear'
  end
end