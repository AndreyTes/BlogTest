require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  let(:user) { create(:user) }
  let!(:post) { create(:post, user:) }
  before :each do
    sign_in user
  end

  context 'Post test' do
    it 'root page' do
      visit posts_path
      expect(page).to have_content("Username: #{user.name}")
    end
  end

  context 'create new post' do
    it 'success' do
      visit new_post_path
      fill_form(:post, { title: '111', description: '222' })
      click_button 'Create Post'
      expect(page).to have_content('Post was successfully created')
      expect(page).to have_content('Title: 111')
      expect(page).to have_content('Description: 222')
    end
    it 'fale' do
      visit new_post_path
      fill_form(:post, { title: '', description: '' })
      click_button 'Create Post'
      expect(page).to have_content("Title can't be blank")
      expect(page).to have_content("Description can't be blank")
    end
  end

  context 'show post success' do
    it 'show post success' do
      visit posts_path
      click_link(href: post_path(post))
      expect(page).to have_content("Title: #{post.title}")
      expect(page).to have_content("Description: #{post.description}")
    end
  end

  context 'update post' do
    it 'success' do
      visit edit_post_path(post)
      fill_form(:update, { title: '000', description: '000' })
      click_button 'Update Post'
      expect(page).to have_content('Post was successfully updated')
      expect(page).to have_content('Title: 000')
      expect(page).to have_content('Description: 000')
    end
    it 'fale' do
      visit edit_post_path(post)
      fill_form(:post, { title: '', description: '' })
      click_button 'Update Post'
      expect(page).to have_content("Title can't be blank")
      expect(page).to have_content("Description can't be blank")
    end
  end

  context 'delete post' do
    it 'success' do
      visit posts_path
      click_button('Delete post')
      expect(page).to have_content('Post was successfully destroyed')
    end
  end
end
