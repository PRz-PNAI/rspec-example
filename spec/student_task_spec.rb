require './lib/student_task.rb'


describe StudentTask do

  subject(:task) do
    StudentTask.new "Bardzo trudne zadanie"
  end

  it { should_not be_assigned }

  describe "#to_s" do
    it "includes task title" do
      expect(task.to_s).to match /Bardzo trudne zadanie/
    end
  end

  describe "#student" do
    it "returns nil" do
      expect(task.student).to be(nil)
    end
  end

end
