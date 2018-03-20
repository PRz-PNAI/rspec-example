class StudentTask

  def initialize(title)
    @title = title
  end

  def to_s
    "Zadanie: #{@title}"
  end

  def student
    nil
  end

  def assigned?
    false
  end
end
