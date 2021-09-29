# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'jk rowling'
    fill_in 'Price', with: 20.86
    fill_in :book_published_date, with: '2014-08-06'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
    expect(page).to have_content('jk rowling')
    expect(page).to have_content(20.86)
    expect(page).to have_content('2014-08-06')

  end

  scenario 'invalid author' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Price', with: '20.86'
    fill_in :book_published_date, with: '2014-08-06'
    click_on 'Create Book'
    visit books_path
    expect(page).not_to have_content('jk rowling')
  end


  scenario 'invalid price' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'jk rowling'
    fill_in :book_published_date, with: '2014-08-06'
    click_on 'Create Book'
    visit books_path
    expect(page).not_to have_content(20.86)
  end

  scenario 'invalid date' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'jk rowling'
    fill_in 'Price', with: 20.86
    click_on 'Create Book'
    visit books_path
    expect(page).not_to have_content('2014-08-06')
  end



end