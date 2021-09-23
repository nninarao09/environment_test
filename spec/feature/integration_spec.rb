# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'jk rowling'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
    expect(page).to have_content('jk rowling')
  end

  scenario 'invalid inputs' do
    visit new_book_path
    fill_in 'Title', with: 5
    fill_in 'Author', with: 3
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('')
    expect(page).to have_content('')
  end
end