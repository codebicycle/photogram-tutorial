require 'rails_helper.rb'

feature 'Index displays a list of posts' do
  scenario 'the index displays correct created job information' do
    # Create multiple posts using factories.
    # User visits the root route.
    # User can see the comments and images of the posts we’ve created.
    job_one = create(:post, caption: 'This is post one')
    job_two = create(:post, caption: 'This is the second post')

    visit '/'
    expect(page).to have_content('This is post one')
    expect(page).to have_content('This is the second post')
    expect(page).to have_css("img[src*='coffee']")
  end
end