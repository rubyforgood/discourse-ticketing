module Ticketing
  class TagGroupConfiguration
    include Singleton
    
    def self.priority_order
      %w(immediate urgent high medium low)
    end

    def self.status_order
      %w(new triaging underway waiting resolved backburner)
    end

    def self.ordered_tag_names_for(tag_group_name)
      case tag_group_name
      when :priority
        priority_order
      when :status
        status_order
      else
        raise NotImplementedError
      end
    end

    def to_hash
      {
        priority_tags: serialized_tag_group('priority', self.class.priority_order),
        status_tags: serialized_tag_group('status', self.class.status_order),
        reason_tags: serialized_tag_group('reason')
      }
    end

    private def serialized_tag_group(group_name, ordering = [])
      tag_group = ::TagGroup.find_by_name(group_name)
      return [] unless tag_group.present?

      unordered_serialized_tags = tag_group.tags.map do |tag|
        {
          id: tag.id,
          raw_name: tag.name,
          display_name: tag.name.gsub(Regexp.new("^#{group_name}-"), "")
        }
      end

      # some gymnastics are required to put tags in order
      ordered_serialized_tags = []
      ordering.each do |tag_display_name|
        # first we find the tag in the unordered list
        index = unordered_serialized_tags.find_index do |serialized_tag|
          serialized_tag[:display_name] == tag_display_name
        end
        # then we append it to the ordered one and delete it from the unordered one
        if index 
          ordered_serialized_tags << unordered_serialized_tags.delete_at(index)
        end
      end
      # then we catch anything we missed
      # this is "everything" if no order array is supplied
      # which means that order is not required!
      ordered_serialized_tags += unordered_serialized_tags

      ordered_serialized_tags
    end
  end
end