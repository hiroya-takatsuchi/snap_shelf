require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe 'メッセージ投稿' do
    context '写真投稿ができる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@post).to be_valid
      end
      it 'explanationは空でも保存できること' do
        @post.explanation = ''
        expect(@post).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'imageが空では登録できない' do
        @post.image = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Image can't be blank")
      end
      it 'titleが空では登録できない' do
        @post.title = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Title can't be blank")
      end
      it 'genre_idが空では登録できない' do
        @post.genre_id = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Genre can't be blank")
      end
      it 'shelf_number_idが空では登録できない' do
        @post.shelf_number_id = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Shelf number can't be blank")
      end
      it 'genre_idに「---」が選択されている場合は出品できない' do
        @post.genre_id = '1'
        @post.valid?
        expect(@post.errors.full_messages).to include("Genre can't be blank")
      end
      it 'shelf_number_idに「---」が選択されている場合は出品できない' do
        @post.shelf_number_id = '1'
        @post.valid?
        expect(@post.errors.full_messages).to include("Shelf number can't be blank")
      end
      it 'userが紐付いていなければ出品できない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('User must exist')
      end
    end
  end
end