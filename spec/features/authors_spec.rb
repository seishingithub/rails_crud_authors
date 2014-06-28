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

  scenario 'User can edit and update authors in list' do
    visit '/'
    click_on 'Add Author'
    fill_in 'Name', with: 'Jean Auel'
    fill_in 'Title', with: 'The Clan of the Cave Bear'
    click_on 'Create Author'
    expect(page).to have_content 'Jean Auel'
    expect(page).to have_content 'The Clan of the Cave Bear'
    click_on 'Jean Auel'
    expect(page).to have_content 'Jean Auel'
    expect(page).to have_content 'The Clan of the Cave Bear'
    click_on 'Edit Author'
    fill_in 'Name', with: 'J.R.R. Tolkein'
    fill_in 'Title', with: 'The Hobbit'
    click_on 'Update Author'
    expect(page).to have_no_content 'Jean Auel'
    expect(page).to have_no_content 'The Clan of the Cave Bear'
    expect(page).to have_content 'J.R.R. Tolkein'
    expect(page).to have_content 'The Hobbit'
  end

  scenario 'User can delete authors from list' do
    visit '/'
    click_on 'Add Author'
    fill_in 'Name', with: 'Jean Auel'
    fill_in 'Title', with: 'The Clan of the Cave Bear'
    click_on 'Create Author'
    expect(page).to have_content 'Jean Auel'
    expect(page).to have_content 'The Clan of the Cave Bear'
    click_on 'Jean Auel'
    expect(page).to have_content 'Jean Auel'
    expect(page).to have_content 'The Clan of the Cave Bear'
    click_on 'Delete Author'
    expect(page).to have_no_content 'Jean Auel'
    expect(page).to have_no_content 'The Clan of the Cave Bear'
  end
end