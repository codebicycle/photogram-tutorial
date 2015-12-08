require 'rails_helper.rb'

feature 'Creating posts' do
  scenario 'Can create a job' do
    # visit the root route
    # click on a button to create a new post
    # fill out the bits of the form that we need. 
    # click the submit button
    # expect the page that we’re sent to to have specific text 
    # expect the page to contain our photo.
    visit '/'
    click_link 'New Post'
    attach_file('Image', 'spec/files/images/coffee.jpg')
    fill_in 'Caption', with: 'nom nom nom #coffeetime'
    click_button 'Create Post'
    expect(page).to have_content('#coffeetime')
    expect(page).to have_css('img[src*="coffee.jpg"]')
  end
  
  it 'needs an image to create a post' do
    # visit root route
    # click the 'New Post' link
    # fill in the caption field (without touching the image field)
    # click the 'Create Post' button
    # expect the page to say, "Halt, you fiend! You need an image to post here!"
    visit '/'
    click_link 'New Post'
    fill_in 'Caption', with: 'No picture because YOLO'
    click_button 'Create Post'
    expect(page).to have_content('You need an image to post here!')
  end
end