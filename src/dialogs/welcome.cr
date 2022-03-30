class Dialogs::Welcome < Maps::Input
  def initialize
    super(key: "name", title: "Name", question: "Please choose your name!")
  end
end
