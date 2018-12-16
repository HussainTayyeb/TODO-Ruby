# Tayyeb Hussain TO-DO-LIST
# [x] Implement a persistence for saving the information
# [x] display the content of persistence
# [x] add elements to file
# [x] delete elements from file
# [x] save written state
# [x] user friendly option (usability)
# [x] add/commit/push to GitHub
class Todo
  def initialize(file_name = 'todo.txt')
    puts '=========Welcome to the TODO app========='
    @file = File.open(file_name)
    data = @file.read
    @items = []
    data.lines.each do |line|
      @items << line
    end
  end

  # show TODO-List
  def display
    puts 'Your TODO list:'
    @items.each_with_index do |item, index|
      puts "#{index + 1}. #{item}"
    end
  end

  def add
    puts 'Add please'
    @items.insert(-1, gets)
    File.open('todo.txt', 'a+') do |g|
      g.puts(@items)
    end
  end

  def delete
    puts 'What do you want to delete'
    # delete_wish = gets didnt worked as intended so i decided to stay with deleting by index
    delete_wish = Integer(gets)
    File.open('todo.txt', 'w') do |_del|
      @items.delete_at(delete_wish)
    end
  end

  # save state
  def save
    f = File.open('todo.txt', 'w')
    f.puts @items
    f.close
  end

  # choose option between add,delete,display
  def option
    puts 'Please enter an option : \'add\' for new task, \'delete\' for delete (0..n) a task and \'display\' for show todo'
  end
end

todo = Todo.new # instance of class
todo.display  # calling display
todo.option   # calling option

@input = gets # User-input for options
if @input.include?('add')
  todo.add
  todo.display
elsif @input.include?('delete')
  todo.delete
  todo.display
elsif @input.include?('display')
  todo.display
else
  puts("Please try again using 'add', 'delete', 'display'")
end

todo.save # save new state
