require 'spec_helper'
require 'omniauth-gaggleamp'

describe OmniAuth::Strategies::GaggleAMP do
  subject { OmniAuth::Strategies::GaggleAMP.new(nil) }

  it 'should add a camelization for itself' do
    OmniAuth::Utils.camelize('gaggleamp').should == 'GaggleAMP'
  end

  describe '#client' do
    it 'has correct GaggleAMP site' do
      subject.client.site.should eq('https://accounts.gaggleamp.com')
    end

    it 'has correct authorize url' do
      subject.client.options[:authorize_url].should eq('oauth/authorize')
    end

    it 'has correct token url' do
      subject.client.options[:token_url].should eq('oauth/token')
    end
  end

  describe '#callback_path' do
    it 'has the correct callback path' do
      subject.callback_path.should eq('/auth/gaggleamp/callback')
    end
  end

  describe '#uid' do
    before :each do
      subject.stub(:raw_info) { { 'id' => 'uid' } }
    end

    it 'returns the id from raw_info' do
      subject.uid.should eq('uid')
    end
  end

  describe '#info' do
    before :each do
      subject.stub(:raw_info) { {} }
    end

    context 'and therefore has all the necessary fields' do
      it { subject.info.should have_key :name }
      it { subject.info.should have_key :email }
      it { subject.info.should have_key :nickname }
    end
  end

  describe '#extra' do
    before :each do
      subject.stub(:raw_info) { { :foo => 'bar' } }
    end

    it { subject.extra['raw_info'].should eq({ :foo => 'bar' }) }
  end

  describe '#raw_info' do
    before :each do
      response = double('response', :parsed => { :foo => 'bar' })
      subject.stub(:access_token) { double('access token', :get => response) }
    end

    it 'returns parsed response from access token' do
      subject.raw_info.should eq({ :foo => 'bar' })
    end
  end
end
