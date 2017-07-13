require 'rails_helper'

RSpec.describe Advertisement, type: :model do
  let(:advert) { Advertisement.create!(title: "New Ad", body: "New Ad Text", price: 100) }
  
  describe "attributes" do
     it "has title, body, and price attributes" do
       expect(advert).to have_attributes(title: "New Ad", body: "New Ad Text", price: 100)
     end
   end
end