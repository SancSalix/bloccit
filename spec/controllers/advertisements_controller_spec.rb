require 'rails_helper'

RSpec.describe AdvertisementsController, type: :controller do

  let(:advert) { Advertisement.create!(title: "Test Ad", body: "Test Ad Body", price: 100) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it "assigns [advert] to @advertisements" do
       get :index
       expect(assigns(:advertisements)).to eq([advert])
     end
  end

  describe "GET new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end
      
      it "renders the #new view" do
        get :new
        expect(response).to render_template :new
      end
      
      it "instantiates @advertisement" do
        get :new
        expect(assigns(:advertisement)).not_to be_nil
      end
    end
 
  describe "ADVERTISEMENT create" do
    it "increases the number of Advertisements by 1" do
        expect{post :create, advertisement: {title: "Test Ad" , body: "Test Ad Line", price: 100}}.to change(Advertisement,:count).by(1)
      end
      
    it "assigns the new advert to @advertisement" do
      post :create, advertisement:  {title: "Test Ad" , body: "Test Ad Line", price: 100}
      expect(assigns(:advertisement)).to eq Advertisement.last
    end
    
    it "redirects to the new advertisement" do
        post :create, advertisement:  {title: "Test Ad" , body: "Test Ad Line", price: 100}
        expect(response).to redirect_to Advertisement.last
    end
  end
    
  describe "GET show" do
     it "returns http success" do
       get :show, {id: advert.id}
       expect(response).to have_http_status(:success)
     end
     it "renders the #show view" do
       get :show, {id: advert.id}
       expect(response).to render_template :show
     end
 
     it "assigns advert to @advertisement" do
       get :show, {id: advert.id}
       expect(assigns(:advertisement)).to eq(advert)
     end
   end

end
