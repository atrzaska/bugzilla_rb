describe User do
  context 'create user' do
    it 'with valid params' do
      user = User.create!(email: 'demo@bugzilla.com', password: 'password', confirmed_at: '2014-06-24 07:38:26.463')
    end

    it 'with invalid params' do
      user = User.create!(email: '', password: '', confirmed_at: '')

      expect user.valid?.to not_eq true
    end
  end

  context 'confirm user' do
    it 'activate account' do

    end
  end

  context 'update user' do
    it 'with valid params' do

    end

    it 'with invalid params' do

    end
  end
end