require 'spec_helper'

feature 'recording statuses' do

  scenario 'User adds a new status' do
    post_status 'I am busy'
    expect(page.find('.statuses tbody tr:first-child')).to have_text('I am busy')
  end

  scenario 'The last added status should have a current decal' do
    post_status 'I am busy'
    expect(page.find('.statuses tbody tr:first-child .decal.primary')).to have_text('CURRENT')
  end

  scenario 'Adding a new status should record a time for the previous one' do
    post_status 'I am busy'
    time_passes 15.minutes
    post_status 'I am still busy'
    expect(page.find('.statuses tbody tr:first-child')).to have_text('I am still busy')
    expect(page.find('.statuses tbody tr:nth-child(2)')).to have_text('I am busy')
  end

  def post_status msg
    visit '/statuses'
    fill_in 'status_message', with: msg
    click_button 'Update'
  end

  def time_passes duration
    Timecop.travel duration.from_now
  end

end
