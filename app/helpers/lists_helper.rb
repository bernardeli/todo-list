module ListsHelper
  def add_task_link(list_form)
    html = list_form.simple_fields_for :tasks, list_form.object.tasks.build, :child_index => 'NEW_RECORD' do |task_form|
      render('task', :task_form => task_form)
    end

    link_to_function 'Add new task', "$('#tasks-fields').append('#{escape_javascript(html)}'.replace(/NEW_RECORD/g, new Date().getTime() ));", :class => 'add-task'
  end
end
