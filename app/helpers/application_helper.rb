module ApplicationHelper
  def add_fields_link(name, f, association, partial, in_class = '')
    new_object = f.object.class.reflect_on_association(association).klass.new

    fields = f.simple_fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s + "/" + partial, :fn => builder)
    end

    link_to(
      name, '#',
      :onclick => "BR_forms.addFields(this, \"#{association}\", \"#{escape_javascript(fields)}\");return false;",
      :class => in_class
    )
  end
end
