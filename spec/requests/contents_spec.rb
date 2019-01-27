require 'rails_helper'

RSpec.describe 'Contents API', type: :request do
  # initialize test data 
  let!(:contents) { create_list(:content, 10) }
  let(:content_id) { contents.first.id }

  # Test suite for GET /contents
  describe 'GET /contents' do
    # make HTTP get request before each example
    before { get '/contents' }

    it 'returns contents' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end


  # Test suite for POST /contents
  describe 'POST /contents' do
    # valid payload
    let(:valid_attributes) { { title: 'Test title', published_date: Time.now + 3, author: 'tester', summary: 'heyyyyy', content: 'test content', status: 'published' } }

    context 'when the request is valid' do
      before { post '/contents', params: valid_attributes }

      it 'creates a content' do
        expect(json['title']).to eq('Test title')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/contents', params: { title: 'Test title 2' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Author can't be blank, Published date can't be blank/)
      end
    end
  end
end  
