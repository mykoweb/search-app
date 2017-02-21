require 'rails_helper'

describe FoodsController do
  before do
    vegetable = Category.create name: 'vegetable'
    seafood   = Category.create name: 'seafood'

    Food.create name: 'carrot', category: vegetable
    Food.create name: 'celery', category: vegetable
    Food.create name: 'turnip', category: vegetable
    Food.create name: 'fish', category: seafood
  end

  describe 'GET #search' do
    context 'with no params' do
      before { get :search }

      it 'succeeds' do
        expect(response).to be_success
      end

      it 'returns an empty JSON' do
        json = JSON.parse(response.body)

        expect(json).to eq []
      end
    end

    context 'with a single category param' do
      before { get :search, params: { category: 'car' } }

      it 'succeeds' do
        expect(response).to be_success
      end

      it 'returns an empty JSON' do
        json = JSON.parse(response.body)

        expect(json).to eq []
      end
    end

    context 'with a single name param' do
      context 'that exists in db' do
        context 'with no category' do
          before { get :search, params: { name: 'carrot' } }

          it 'succeeds' do
            expect(response).to be_success
          end

          it 'returns the correct JSON' do
            json = JSON.parse(response.body)

            expect(json).to eq [{ 'name' => 'carrot', 'category' => { 'name' => 'vegetable' } }]
          end
        end

        context 'with the correct category' do
          before { get :search, params: { name: 'carrot', category: 'vegetable' } }

          it 'succeeds' do
            expect(response).to be_success
          end

          it 'returns the correct JSON' do
            json = JSON.parse(response.body)

            expect(json).to eq [{ 'name' => 'carrot', 'category' => { 'name' => 'vegetable' } }]
          end
        end

        context 'with the wrong category' do
          before { get :search, params: { name: 'carrot', category: 'truck' } }

          it 'succeeds' do
            expect(response).to be_success
          end

          it 'returns an empty JSON' do
            json = JSON.parse(response.body)

            expect(json).to eq []
          end
        end
      end

      context 'that does not exist in db' do
        before { get :search, params: { name: 'alfalfa' } }

        it 'succeeds' do
          expect(response).to be_success
        end

        it 'returns an empty JSON' do
          json = JSON.parse(response.body)

          expect(json).to eq []
        end
      end
    end

    context 'with multiple name params' do
      context 'that exist in db' do
        context 'with no category' do
          before { get :search, params: { 'name[]' => %w(carrot Celery turnip fish) } }

          it 'succeeds' do
            expect(response).to be_success
          end

          it 'returns the correct JSON' do
            json = JSON.parse(response.body)

            expect(json).to eq [
              { 'name' => 'carrot', 'category' => { 'name' => 'vegetable' } },
              { 'name' => 'celery', 'category' => { 'name' => 'vegetable' } },
              { 'name' => 'fish', 'category' => { 'name' => 'seafood' } },
              { 'name' => 'turnip', 'category' => { 'name' => 'vegetable' } }
            ]
          end
        end

        context 'with the correct category' do
          before do
            get :search, params: {
              'name[]'   => %w(carrot celery turnip fish),
              'category' => 'vegetable'
            }
          end

          it 'succeeds' do
            expect(response).to be_success
          end

          it 'returns the correct JSON' do
            json = JSON.parse(response.body)

            expect(json).to eq [
              { 'name' => 'carrot', 'category' => { 'name' => 'vegetable' } },
              { 'name' => 'celery', 'category' => { 'name' => 'vegetable' } },
              { 'name' => 'turnip', 'category' => { 'name' => 'vegetable' } }
            ]
          end
        end

        context 'with the wrong category' do
          before do
            get :search, params: {
              'name[]'   => %w(carrot celery turnip fish),
              'category' => 'building'
            }
          end

          it 'succeeds' do
            expect(response).to be_success
          end

          it 'returns an empty JSON' do
            json = JSON.parse(response.body)

            expect(json).to eq []
          end
        end
      end

      context 'that do not exist in db' do
        before do
          get :search, params: {
            'name[]'   => %w(canon nikon sony)
          }
        end

        it 'succeeds' do
          expect(response).to be_success
        end

        it 'returns an empty JSON' do
          json = JSON.parse(response.body)

          expect(json).to eq []
        end
      end
    end
  end
end
