require 'rails_helper'

feature 'Friendship', type: :feature do
    before(:each) do
        user1 = FactoryBot.create(:user)
        @user2 = FactoryBot.create(:user)
        visit new_user_session_path
        within('form') do
            fill_in 'user_email', with: user1.email
            fill_in 'user_password', with: user1.password
        end
        click_on 'Log in'
    end

    scenario 'Follow someone in homepage' do
        click_on 'follow-btn'
        expect(page).to have_content('Followed successfully')
    end

    scenario 'Follow someone in memo creators' do
        visit users_path
        click_on 'follow-btn'
        expect(page).to have_content('Followed successfully')
    end

    scenario 'Unfollow someone in memo creators' do
        visit users_path
        click_on 'follow-btn'
        click_on 'unfollow-btn'
        expect(page).to have_content('Unfollowed successfully')
    end
end