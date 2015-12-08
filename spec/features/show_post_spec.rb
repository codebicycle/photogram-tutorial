require 'rails_helper.rb'

feature 'Can view individual posts' do
  scenario 'Can click and view a single post' do
    # create a post with factory_girl
    # visit '/'
    # click on an image link
    # expect to be taken to the show page of our post
    post = create(:post)

    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(page.current_path).to eq(post_path(post))
  end
end