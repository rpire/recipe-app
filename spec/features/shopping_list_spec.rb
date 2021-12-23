require 'rails_helper'

RSpec.feature 'Recipe index', type: :feature do
  background do
    login_user
    visit shopping_list_index_path
  end

  scenario 'Should display the recipe\'s name' do
    expect(page).to have_content(@recipe.name)
  end

  scenario 'Should display an added ingredient' do
    expect(page).to have_content(@ingredient.food.name)
  end

  scenario 'Should display the food measurement unit' do
    expect(page).to have_content(@ingredient.food.measurement_unit)
  end

  scenario 'Should display the food price' do
    expect(page).to have_content('$5.0')
  end

  scenario 'should display total ingredients' do
    expect(page).to have_content('Total ingredients:')
  end

  scenario 'should display total price' do
    expect(page).to have_content('Total price:')
  end
end
