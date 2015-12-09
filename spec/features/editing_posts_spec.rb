require 'rails_helper.rb'

feature 'Editing posts' do
  background do
    # create a job with factory_girl
    # visit the root route
    # click the image of the post we created with factory_girl
    # click the 'edit post' link
    post = create(:post, caption: 'This should be edited')
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
  end

  it 'Can edit a post' do
    # fill in 'Caption' with "Oh god, you weren’t meant to see this picture!"
    # click the ’Update Post’ button
    # expect the page to have content saying "Post updated."
    # expect the page to have content saying “Oh god, you weren’t meant to see this picture!”
    fill_in 'Caption', with: 'I\'m editing it now'
    click_button 'Update Post'
    expect(page).to have_content('Post updated')
    expect(page).to have_content('I\'m editing it now')
  end

  it 'Can\'t edit a post without an image' do
    # starting after the actions in the background block:
    # fill in the 'Image' field with nothing
    # click the 'Update Post' button
    # expect to see the message: 'Something is wrong with your form!'
    attach_file('Image', 'spec/files/coffee.txt')
    click_button 'Update Post'
    expect(page).to have_content('Update failed')
  end
  
end