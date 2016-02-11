module ApplicationHelper
	#f = form builder
	def link_to_add_fields(name, f, association)
		new_obj = f.object.send(association).klass.new
		id = new_obj.object_id
		fields = f.fields_for(association, new_obj, child_index: id) do |b|
			render(association.to_s.singularize + "_fields", f: b)
		end
		link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
	end
end
