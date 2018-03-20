class StudentTask

  def initialize(title)
    @title = title
  end

  def to_s
    "Zadanie: #{@title}, Wykonawca: #{@student}"
  end

  def student
    @student
  end

  def assign(student)
    if Student.exists? student
      @student = student
    else
      raise "No such student: #{student}"
    end
  end

  def assigned?
    !@student.nil?
  end

end
