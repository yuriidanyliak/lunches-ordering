require 'rails_helper'

describe 'daily_menus/show.html.erb' do
  it 'has required content' do
    assign(:daily_menu, create(:daily_menu))

    render

    expect(rendered).to have_content('Menu for')
    expect(rendered).to have_content('First courses')
    expect(rendered).to have_content('Main courses')
    expect(rendered).to have_content('Drinks')

    expect(rendered).to have_css('ol')
  end

  it 'contains ordered list' do
    assign(:daily_menu, create(:daily_menu))

    render

    expect(rendered).to have_css('ol')
  end
end