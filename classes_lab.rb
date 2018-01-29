class Student

  def initialize(name, cohort)

    @name = name
    @cohort = cohort

  end

  def get_name()

    return @name

  end

  def get_cohort()

    return @cohort

  end

  def set_name(name)

    @name = name

  end

  def set_cohort(cohort)

    @cohort = cohort

  end

  def talk()

    return "I can talk!"

  end

  def fave_lang(lang)

    return "I love #{lang}"

  end

end

# sports team

class Team

  attr_accessor :team_name, :players, :coach, :points

  def initialize(team_name, players, coach, points)

    @team_name = team_name
    @players = players
    @coach = coach
    @points = points

  end

  # def get_team_name()
  #
  #   return @team_name
  #
  # end

  # def get_players()
  #
  #   return @players
  #
  # end
  #
  # def get_coach()
  #
  #   return @coach
  #
  # end

  def new_coach(coach)

    @coach = coach

  end

  def add_player(player)

    @players.push(player)

  end

  def find_player(player_to_find)

    for player in @players
      if player_to_find == player
        return true
      end
    end
    return false

  end

  def win_or_lose(result)

    if result == "W"
      @points += 3
    end

  end

end

# extension

class Library

  attr_reader :books

  def initialize(books)

    @books = books

  end

  def get_info_for_title(title)

    for book in @books
      if book[:title] == title
        return book
      end
    end
    return nil

  end

  def get_rental_details_for_title(title)

    book = get_info_for_title(title)
    if book != nil
      return book[:rental_details]
    end

  end

  def add_new_book(title_to_add)

    book = {
    title: "#{title_to_add}",
    rental_details: {student_name: "",
      date: ""}
    }

    @books.push(book)

  end

  def change_rental_details(title, student, date)

    book = get_info_for_title(title)
    book[:rental_details][:student_name] = student
    book[:rental_details][:date] = date

  end


end
