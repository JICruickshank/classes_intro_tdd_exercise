require('minitest/rg')
require('minitest/autorun')
require_relative('../classes_lab')

class TestStudent < MiniTest:: Test

  def test_get_name()

    student = Student.new("Jonathan", 4)
    assert_equal("Jonathan", student.get_name())

  end

  def test_get_cohort()

    student = Student.new("Jonathan", 4)
    assert_equal(4, student.get_cohort())

  end

  def test_set_name()

    student = Student.new("Jonathan", 4)
    assert_equal("Victor", student.set_name("Victor"))

  end

  def test_set_cohort()

    student = Student.new("Jonathan", 4)
    assert_equal(12, student.set_cohort(12))

  end

  def test_talk()

    student = Student.new("Jonathan", 4)
    assert_equal("I can talk!", student.talk())

  end

  def test_fave_lang()

    student = Student.new("Jonathan", 4)
    assert_equal("I love Ruby", student.fave_lang("Ruby"))

  end

end

class TestTeam < MiniTest::Test

  def test_get_team_name()

    team = Team.new("Celtic", [], "Brendan Rodgers", 0)
    assert_equal("Celtic", team.team_name())

  end

  def test_get_players()

    team = Team.new("Celtic", [], "Brendan Rodgers", 0)
    assert_equal(0, (team.players).length())
  #
  end
  #
  def test_get_coach()

    team = Team.new("Celtic", [], "Brendan Rodgers", 0)
    assert_equal("Brendan Rodgers", team.coach())

  end
  #
  def test_new_coach()

    team = Team.new("Celtic", [], "Brendan Rodgers", 0)
    assert_equal("Martin O'Neill", team.new_coach("Martin O'Neill"))


  end

  def test_add_player()

    team = Team.new("Celtic", [], "Brendan Rodgers", 0)
    result = team.add_player("Bobo Balde")
    assert_equal(1, result.length)

  end

  def test_find_player()

    team = Team.new("Celtic", ["Didier Agathe"], "Brendan Rodgers", 0)
    assert_equal(true, team.find_player("Didier Agathe"))

  end

  def test_find_player__player_not_found()

      team = Team.new("Celtic", [], "Brendan Rodgers", 0)
      assert_equal(false, team.find_player("Gary Hooper"))

  end

  def test_win_or_lose()

    team = Team.new("Celtic", [], "Brendan Rodgers", 0)
    team.win_or_lose("W")
    assert_equal(3, team.points)

  end

end

# extension

class TestLibrary < MiniTest::Test

  def test_library_has_books
    library = Library.new([])
    assert_equal([], library.books)

  end

  def test_get_info_for_title

    book = {
    title: "Lord of the Rings",
    rental_details: {
     student_name: "Jeff",
     date: "01/12/16"
    }
  }
  library = Library.new([book])
  book_info = library.get_info_for_title("Lord of the Rings")
  assert_equal(book, book_info)

  end

  def test_get_rental_details_for_title

    book = {
    title: "Lord of the Rings",
    rental_details: {
     student_name: "Jeff",
     date: "01/12/16"
      }
    }
    library = Library.new([book])
    details = library.get_rental_details_for_title("Lord of the Rings")
    assert_equal(book[:rental_details], details)

  end

    def test_get_rental_details_for_title__not_found

      library = Library.new([])
      result = library.get_rental_details_for_title("Harry Potter")
      assert_nil(result)

    end


  def test_add_new_book

    library = Library.new([])
    new_book = {
      title: "The Day of the Jackal",
      rental_details: {
        student_name: "",
        date: ""
      }
    }
    library.add_new_book(new_book)
    assert_equal(1, library.books.length)

  end

  def test_change_rental_details

    book = {
    title: "Lord of the Rings",
    rental_details: {
     student_name: "Jeff",
     date: "01/12/16"
      }
    }
    library = Library.new([book])
    new_details = {student_name: "Jonathan", date: "29/01/2017"}
    library.change_rental_details("Lord of the Rings", "Jonathan", "29/01/2017")
    book_info = library.get_rental_details_for_title(book[:title])
    assert_equal(new_details, book_info)

  end

end
