require 'rails_helper'

RSpec.describe Attendance, type: :model do
 
	before(:each) do 
		@attendance = FactoryBot.create(:attendance)
	end

	it "has a valid factory" do
		expect(build(:attendance)).to be_valid
	end

	context "validation" do
		it 'should validates attendance with attributes' do 
			expect(@attendance).to be_a(Attendance)
		end

	end


end