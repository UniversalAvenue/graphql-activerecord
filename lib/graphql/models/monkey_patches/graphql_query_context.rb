class GraphQL::Query::Context
  def include?(item)
    !!(@values && @values.include?(item))
  end

  def ability
    @values[:ability] if include?(:ability)
  end

  def can?(action, subject, *extra_args)
    return true unless ability
    ability.can?(action, subject, *extra_args)
  end

  def model_cache
    @model_cache ||= {}
  end
end
