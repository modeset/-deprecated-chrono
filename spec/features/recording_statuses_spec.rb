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

  scenario 'The last added status should have no time yet' do
    post_status 'I am busy'
    expect(page.find('.statuses tbody tr:first-child')).to have_text('I am busy')
    expect(page.find('.statuses tbody tr:first-child')).to have_text('0 hours')
  end

  scenario 'Adding a new status should bump down the previous status' do
    post_status 'I am busy'
    time_passes 15.minutes
    post_status 'I am still busy'
    expect(page.find('.statuses tbody tr:nth-child(1)')).to have_text('I am still busy')
    expect(page.find('.statuses tbody tr:nth-child(2)')).to have_text('I am busy')
  end

  scenario 'Adding a new status should record a time for the previous one' do
    post_status 'I am busy'
    time_passes 15.minutes
    post_status 'I am still busy'
    expect(page.find('.statuses tbody tr:nth-child(2)')).to have_text('0.25 hours')
  end

  scenario 'Multiple statuses should have their hours summed up in the daily header' do
    post_status 'I am busy'
    time_passes 45.minutes
    post_status 'I am still busy'
    time_passes 60.minutes
    post_status 'Yup, still busy'
    time_passes 150.minutes
    reload_page
    expect(page.find('.statuses thead tr')).to have_text('4.25 hours')
  end

  scenario 'Posting an out status should have an out decal' do
    post_status 'I am busy', out: true
    expect(page.find('.statuses tbody tr:first-child .decal.primary')).to have_text('OUT')
  end

  scenario 'Posting an out status should stop the clock on the previous status' do
    post_status 'I am busy'
    time_passes 45.minutes
    post_status 'I am still busy'
    time_passes 60.minutes
    post_status 'I am out', out: true
    time_passes 60.minutes
    reload_page
    expect(page.find('.statuses tbody tr:nth-child(2)')).to have_text('1 hours')
  end

  scenario 'An out status should not be counted towards the daily hours total' do
    post_status 'I am busy'
    time_passes 45.minutes
    post_status 'I am still busy'
    time_passes 60.minutes
    post_status 'I am out', out: true
    time_passes 60.minutes
    reload_page
    expect(page.find('.statuses thead tr')).to have_text('1.75 hours')
  end

  def post_status msg, options = {}
    visit '/statuses'
    fill_in 'status_message', with: msg
    check 'status_is_clock_out' if options[:out]
    click_button 'Update'
  end

  def time_passes duration
    Timecop.travel duration.from_now
  end

  def reload_page
    visit current_path
  end

end
