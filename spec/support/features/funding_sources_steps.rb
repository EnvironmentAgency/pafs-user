# frozen_string_literal: true

module Features
  module FundingSourcesSteps
    def select_funding_sources(*funding_sources)
      click_on 'Add the funding sources and spending details'
      expect(page).to have_selector('h1', text: 'What are the expected funding sources?')

      funding_sources.map { |source_name| check source_name }
      click_on 'Save and continue'
    end

    def add_contributor(name)
      within(:css, '') do
        fill_in 'What is the contributor name', with: :name
      end

      click_on 'Add another contributor'
    end

    # funding map is a hash detailing the funding for that particular year in the following format:
    # [ 
    #   'Previous Years' => {
    #     amount: '1000',
    #     secured: false,
    #     constrained: true
    #   }
    # ]
    def enter_breakdown_for_contributor(name, funding_map)
      container = find('h3', text: name).ancestor(:css, 'div.container')

      within container do
        funding_map.each do |year_key, year_funding|
          row = find('td', text: year_key).ancestor('tr')

          within row do
            fill_in year_key, with: year_funding['amount']
          end
        end
      end
    end
  end
end
