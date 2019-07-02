# frozen_string_literal: true

include ActionView::Helpers::NumberHelper

RSpec.feature 'Adding a projects funding sources', type: :feature do
  let(:user) { create(:account_user, :rma) }

  before do
    login_as(user)
    bootstrap_a_new_proposal(
      type: 'DEF',
      name: 'A new project',
      year: Time.now.year + 2
    )

    view_a_project(PafsCore::Project.last)
  end

  scenario 'add local levy funding contributions' do
    select_funding_sources 'Local levy'

    expect(page).to have_selector('h1', text: 'What is the estimated spend for each financial year?')

    labels = (2015..Time.now.year + 2).to_a.map do |year|
      "Local levy #{year} to #{year + 1}"
    end

    labels.push("Local levy Previous years")

    labels.each do |label|
      fill_in label, with: 1000
    end

    total_local_levy = labels.size * 1000

    click_on 'Save and continue'

    expect(page).to have_selector('h1', text: 'Confirm the estimated spend for each financial year.')
    click_on 'Save and continue'

    expect(page).to have_selector('h1', text: 'Proposal overview')
    expect(page).to have_selector('td', text: 'Local levy')
    expect(page).to have_selector('td', text: number_to_currency(total_local_levy, unit: '£', precision: 0))
  end

  scenario 'add private sector contributions' do
    select_funding_sources 'Private sector contributions'
    expect(page).to have_selector('h1', text: 'Who are the expected private sector contributors?')

    add_contributor('BigCo Ltd')
    add_contributor('EnviroCo')
    click_on 'Save and continue'

    expect(page).to have_selector('h1', text: 'What is the estimated spend from private sector contributions for each financial year?')
    expect(page).to have_selector('h3', text: 'BigCo Ltd')
    expect(page).to have_selector('h3', text: 'EnviroCo')

    labels = (2015..Time.now.year + 2).to_a.map do |year|
      "#{year} to #{year + 1}"
    end

    labels.push('Previous Years')

    funding_map = labels.each do |label|
      {
        label => {
          amount: 1000,
          secured: true,
          constrained: false
        }
      }
    end

    enter_breakdown_for_contributor('BigCo Ltd', funding_map)
    enter_breakdown_for_contributor('EnviroCo', funding_map)
    click_on 'Save and continue'
  end
end
