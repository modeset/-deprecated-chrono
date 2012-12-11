require 'spec_helper'

feature 'recording statuses' do

  scenario 'User adds a new status' do
    visit '/statuses'
    fill_in 'status_message', with: 'I am busy'
    click_button 'Update'
    expect(page.find('#statuses tbody tr:first-child')).to have_text('I am busy')
  end

end
