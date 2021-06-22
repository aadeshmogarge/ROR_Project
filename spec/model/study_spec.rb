require "rails_helper"

describe Study, type: :model do
    context "when study do not have name" do
        it "is invalid" do 
            study = Study.new(name: '', age_limit: 10, drug: 'abcd', phase: 4)

            expect(study.valid?).to eq false
        end
    end

    context "when study have a name" do 
        it "is valid" do 
            study = Study.new(name: 'my_study', age_limit: 10, drug: 'abcd', phase: 4)

            expect(study.valid?).to eq true
        end
    end

    context "when study do not have drug" do
        it "is invalid" do 
            study = Study.new(name: 'name', age_limit: 10, drug: '', phase: 4)

            expect(study.valid?).to eq false
        end
    end

    context "when study have a drug" do 
        it "is valid" do 
            study = Study.new(name: 'my_study', age_limit: 10, drug: 'abcd', phase: 4)

            expect(study.valid?).to eq true
        end
    end

    context "When age is less than or equal to 7" do
        it "invalid" do
            study = Study.new(age_limit: 6, name: 'my_study', drug: 'abcd', phase: 4)

            expect(study.valid?).to eq false
        end
    end

    context "When age is greater than 7" do
        it "valid" do
            study = Study.new(age_limit: 8, name: 'my_study', drug: 'abcd', phase: 4)

            expect(study.valid?).to eq true
        end
    end

    context "When phase is less than or equal to 5" do
        it "valid" do
            study = Study.new(age_limit: 8, name: 'my_study', drug: 'abcd', phase: 4)

            expect(study.valid?).to eq true
        end
    end

    context "When phase is greater than 5" do
        it "invalid" do
            study = Study.new(age_limit: 8, name: 'my_study', drug: 'abcd', phase: 10)

            expect(study.valid?).to eq false
        end
    end


end



# require "rails_helper"

# describe Study, type: model do

#   context 'when study do not have a name' do
#     it 'is invalid' do
#       study = Study.new(name: '')
#       expect(study.valid?).to eq false
#   end
#  end

#  context 'when study do not have a name' do
#     it 'is valid' do
#       study = Study.new(name: 'my_study')
#       expect(study.valid?).to eq true
#     end
#   end
# end
