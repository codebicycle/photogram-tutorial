require 'rails_helper.rb'

feature 'Deleting posts' do
  background do
    # create an example post using factory_girl
    # visit the root route
    # click on the image to 'show' the individual post
    # click on the 'Edit Post' button to enter the edit view
    post = create(:post, caption: 'Delete this image!')
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
  end

  it 'Can delete a post' do 
    # click on the 'Delete Post' link
    # expect to be routed to the root again.
    # expect to see the message "Problem solved!  Post deleted."
    # expect to not see the old post anymore.
    click_link 'Delete Post'
    expect(page.current_path).to eq(root_path)
    expect(page).to have_content('Post deleted.')
    expect(page).to_not have_content('Delete this image!')
  end
  
end