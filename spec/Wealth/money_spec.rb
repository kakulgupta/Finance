require 'spec_helper'

describe 'Money' do

    let(:money1) { Money.new(45, 0) }
    let(:money2) { Money.new(55, 0) }
    let(:money3) { Money.new(0, 67) }
    let(:money4) { Money.new(45, 76) }

    describe 'represenation of money' do

        it 'viewing the money with both rupee and paise' do
            expect(money4.to_s).to eq("Rs 45 & 76 paise")
        end

        it 'viewing the money with only paise' do
            expect(money3.to_s).to eq("Rs 0 & 67 paise")
        end

        it 'viewing the money with only rupee' do
            expect(money2.to_s).to eq("Rs 55 & 0 paise")
        end

    end

    describe 'Addition of Money' do

        it 'adding two inputs only in rupee' do
            expect(money1 + money2).to eq(Money.new(100, 0))
        end

        it 'adding one input of rupee and one input of paise' do
            expect(money1 + money3).to eq(Money.new(45, 67))
        end

        it 'adding one input of rupee and one input of rupee/paise' do
            expect(money2 + money4).to eq(Money.new(100, 76))
        end

        it 'adding one input of paise and one input of rupee/paise' do
            expect(money3 + money4).to eq(Money.new(46, 43))
        end

        describe 'Addition for more than two Moneys' do

            it 'adding three moneys' do
                expect(money1 + money2 + money3).to eq(Money.new(100, 67))
            end

        end

    end

    describe 'Subtraction of money' do

        it 'subtracting two inputs only in rupee' do
            expect(money1 - money2).to eq(Money.new(-10, 0))
        end

        it 'subtracting one input of rupee and one input of paise' do
            expect(money1 - money3).to eq(Money.new(44, 33))
        end

        it 'subtracting one input of rupee and one input of rupee/paise' do
            expect(money2 - money4).to eq(Money.new(9, 24))
        end

        it 'subtracting one input of paise and one input of rupee/paise' do
            expect(money3 - money4).to eq(Money.new(-45, -9))
        end
    end

    describe 'Check if same class' do

    	it 'should compare money object with nil' do
            expect(money1).not_to eq(nil)
        end

        it 'should compare money object with object of different Class' do
      		expect(money2).not_to eq(1)
    	end
    end
end