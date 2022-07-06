require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'すべての情報が正しく入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameがないと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailがないと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@を含まないと登録できない' do
        @user.email = 'aaacom'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordがないと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordは6文字以上でないと登録できない' do
        @user.password = '12345'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが英字だけだと登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが数字だけだと登録できない' do
        @user.password = '123456'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'abc123'
        @user.password_confirmation = 'aaa111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'second_nameがないと登録できない' do
        @user.second_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Second name can't be blank")
      end
      it 'second_nameが英字だと登録できない' do
        @user.second_name = 'sei'
        @user.valid?
        expect(@user.errors.full_messages).to include('Second name is invalid')
      end
      it 'first_nameがないと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが英字だと登録できない' do
        @user.first_name = 'mei'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'second_name_kanaがないと登録できない' do
        @user.second_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Second name kana can't be blank")
      end
      it 'second_name_kanaが漢字だと登録できない' do
        @user.second_name_kana = '姓'
        @user.valid?
        expect(@user.errors.full_messages).to include('Second name kana is invalid')
      end
      it 'second_name_kanaがひらがなだと登録できない' do
        @user.second_name_kana = 'せい'
        @user.valid?
        expect(@user.errors.full_messages).to include('Second name kana is invalid')
      end
      it 'second_name_kanaが英字だと登録できない' do
        @user.second_name_kana = 'sei'
        @user.valid?
        expect(@user.errors.full_messages).to include('Second name kana is invalid')
      end
      it 'first_name_kanaがないと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'first_name_kanaが漢字だと登録できない' do
        @user.first_name_kana = '名'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
      it 'first_name_kanaがひらがなだと登録できない' do
        @user.first_name_kana = 'めい'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
      it 'first_name_kanaが英字だと登録できない' do
        @user.first_name_kana = 'mei'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
      it 'date_of_birthがないと登録できない' do
        @user.date_of_birth = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Date of birth can't be blank")
      end
    end
  end
end
