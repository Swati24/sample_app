module ApplicationHelper

	def get_valid_actions(article, loc)
		actions = []
		ability = Ability.new(current_user)
		if loc == "index"
			if ability.can? :update, article
				actions << link_to('Edit', edit_article_path(article), class: "btn btn-default")
				actions << link_to('Destroy', article, method: :delete, data: { confirm: 'Are you sure?' }, class: 'btn btn-default btn-danger')
			end
		else
			if article.state? :drafted and ability.can? :publish, article
				actions << button_to('Publish', publish_article_path(article), :method => :put, :class => 'btn btn-success')
			end
		end
		return actions
	end

end
