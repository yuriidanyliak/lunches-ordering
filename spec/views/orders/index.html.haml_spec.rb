require 'rails_helper'

describe 'orders/index.html.haml' do

  it 'has link to create an order' do
    render

    expect(rendered).to have_link 'Create an order', href: new_order_path
  end

  it 'contains calendar' do
    render

    expect(rendered).to have_selector('#calendar-user')
  end

end