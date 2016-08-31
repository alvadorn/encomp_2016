require 'erb'

module TemplateRenderer
  def self.empty_binding
    binding
  end

  def self.render(template, locals = {})
    bind = empty_binding
    locals.each do |k, v|
      bind.local_variable_set(k,v)
    end
    tmp = ERB.new(File.read(template), nil, "%")
    tmp.result(bind)
  end

end

#p = { name: "Fulano da Silva", courses: [{name: "1"}, {name: "2"}], value_to_pay: "15.0"}
#puts TemplateRenderer.render("mail_views/inscricao.html.erb", {person: p})
