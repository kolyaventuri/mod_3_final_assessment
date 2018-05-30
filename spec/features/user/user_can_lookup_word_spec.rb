require 'rails_helper'

feature 'Any user visiting the root' do
  context 'can enter a valid word' do
    scenario 'and be shown its root form' do
      VCR.use_cassette('valid_word_lookup') do
        visit '/'

        fill_in 'word', with: 'foxes'
        click_on 'Lookup Word'

        expect(current_path).to eq('/')
        expect(page).to have_content("'foxes' is a valid word and its root form is 'fox'.")
      end
    end
  end

  context 'can enter an invalid word' do
    scenario 'and be told that it is invalid' do
      VCR.use_cassette('invalid_word_lookup') do
        visit '/'

        fill_in 'word', with: 'foxez'
        click_on 'Lookup Word'

        expect(current_path).to eq('/')
        expect(page).to have_content("'foxez' is not a valid word.")
      end
    end
  end
end
