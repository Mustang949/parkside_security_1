require 'rails_helper'
require 'net/http'
require 'json'

# Removes text before the pound in an href string
def trim_href(string)
  '#' + string.split('#')[1]
end

nike_text = 'In ancient Greek religion, Nike was a goddess who personified victory. Her Roman equivalent was Victoria.'

RSpec.feature 'On the Metis (mythology) page', :type => :feature, js: true do

  scenario 'a) the headings listed in the Contents box are used as headings on the page' do
    visit '/wiki/Metis_(mythology)'
    contents_headings = all('li.toclevel-1 > a')
    contents_headings.each do |contents_heading|
      puts "Checking Contents box header: #{contents_heading.find('span.toctext').text}"
      expect(find(trim_href(contents_heading[:href])).text).to eq(contents_heading.find('span.toctext').text)
    end
  end

  scenario 'b) the headings listed in the `Contents` box have functioning hyperlinks' do
    visit '/wiki/Metis_(mythology)'
    contents_headings = all('li.toclevel-1 > a')
    contents_headings.each do |contents_heading|
      expect(find(trim_href(contents_heading[:href])).text).to be_truthy
    end
  end

  scenario 'c) in the _Personified concepts_, `Nike` has a popup that contains the following text: ' + nike_text do
    visit '/wiki/Metis_(mythology)'
    link = ''
    sleep 0.5 # Wait for the JS that opens the popup to load
    within find('table.vertical-navbox') do
      link = find("a[href='/wiki/Nike_(mythology)']")
    end
    link.hover
    popup = find('.mwe-popups')
    expect(popup.text).to eq(nike_text)
  end

  scenario 'd) in the _Personified concepts_, if you click on `Nike`, it takes you to a page that displays a family tree' do
    visit '/wiki/Metis_(mythology)'
    link = ''
    within find('table.vertical-navbox') do
      link = find("a[href='/wiki/Nike_(mythology)']")
    end
    link.click
    family_tree = find('#Family_tree')
    expect(family_tree).to be_truthy
  end
end
