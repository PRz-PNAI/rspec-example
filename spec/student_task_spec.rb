require './lib/student_task.rb'


describe StudentTask do

  let(:title) { "Bardzo trudne zadanie" }
  subject(:task) { StudentTask.new title }

  it { should_not be_assigned }

  describe "#to_s" do
    it "includes task title" do
      expect(task.to_s).to match /#{title}/
    end
  end

  describe "#student" do
    it "returns nil" do
      expect(task.student).to be(nil)
    end
  end

  context "when assigned" do
    let(:student) { "Jan Kowalski" }
    subject(:task) do
      t = StudentTask.new title
      t.assign student
      t
    end

    it { should be_assigned }

    describe "#to_s" do
      it "returns assigned student" do
        expect(subject.to_s).to match /#{student}/
      end
    end

    describe "#student" do
      it "returns assigned student" do
        expect(subject.student).to equal student
      end
    end
  end

end
