require 'spec_helper'

describe ProjectsController do
  before do
    sign_in user
  end

  let(:user) { create(User) }

  context 'GET#index' do
    it 'render view' do
      get :index
      expect(response.status).to eq 200
      expect(User.all).to include user
    end
  end

  context 'GET#new' do
    it 'create'
  end
end