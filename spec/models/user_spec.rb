require 'rails_helper'

RSpec.describe User, type: :model do
  
	before(:each) do 
    @user = FactoryBot.create(:user)    
  end

  it "has a valid factory" do
    # teste toujours tes factories pour voir si elles sont valides
    expect(build(:user)).to be_valid
  end

  context "associations" do 

  	describe "event" do 
  		it {expect(@user).to have_many(:events)}
  	end

    describe "attendance" do 
      it {expect(@user).to have_many(:attendances)}
    end

	 end


end
