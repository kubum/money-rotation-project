require 'spec_helper'

describe Record do
  it { should allow_mass_assignment_of(:amount) }
  it { should allow_mass_assignment_of(:comment) }
  it { should allow_mass_assignment_of(:flow) }
  
  it { should validate_presence_of(:comment) }
  it { should validate_presence_of(:amount) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:flow) }
  
  it { should validate_numericality_of(:amount) }
    
  it { should ensure_inclusion_of(:flow).in_array(['income', 'expense']) }
    
  it { should belong_to(:user) }
  
  describe "model configuration" do
    before(:each) do
      @incomes  = 3
      @expenses = 2
      
      @user = FactoryGirl.create(:user)
      
      @incomes.times { FactoryGirl.create(:record_income, :user => @user) }
      @expenses.times { FactoryGirl.create(:record_expense, :user => @user) }      
    end
       
    it "should hold only income" do
      @user.records.income.count.should == @incomes
    end
  
    it "should hold only expenses" do
      @user.records.expense.count.should == @expenses
    end
  
    it "should hold all" do
      @user.records.count.should == @incomes + @expenses
    end
  end
end
