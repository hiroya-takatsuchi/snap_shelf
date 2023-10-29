require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント投稿' do
    context 'コメントが投稿できる場合' do
      it 'textが存在していれば保存できる' do
        expect(@comment).to be_valid
      end
    end
    context 'コメントが投稿できない場合' do
      it 'textが空では保存できない' do
        @comment.text = nil
        expect(@comment).to be_invalid
      end
      it 'userが紐付いていなければ出品できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('User must exist')
      end
      it 'postが紐付いていなければ出品できない' do
        @comment.post = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Post must exist')
      end
    end  
  end
end

