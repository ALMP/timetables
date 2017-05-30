require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  let(:valid_attributes) { {
          password: 'pippo',
          code: 'MGE_04'
  }
  }

  let(:invalid_attributes) {{
          password: 'pluto',
          code: 'MGE_04'
  }
  }

  describe "GET #new session" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create session" do
    it "returns flash message" do
      post :create, params:  {:session => invalid_attributes}
      expect(flash[:danger]).to be_present
    end
  end


  describe "POST #create session" do
    it "returns http success" do
      post :create, params:  {:session => valid_attributes}
      expect(response).to redirect_to(employee_path(Employee.find_by(code: valid_attributes[:code])))
    end
  end


  describe "DELETE #delete session" do
    it "redirect to root_path" do
      post :destroy
      expect(response).to redirect_to(login_path)
    end
  end

end
