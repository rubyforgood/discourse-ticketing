module Ticketing
  class Ticket
    def self.all
      Collection.new
    end

    def self.order(attribute, asc_or_desc = :asc)
      Collection.new.order(attribute, asc_or_desc)
    end

    def self.filter(filter_string)
      Collection.new.filter(filter_string)
    end

    class Collection
      include Enumerable

      def initialize
        self.source_relation = base_relation
      end

      def to_a
        source_relation.map { |item| collected_class.new(item) }
      end

      def order(attribute, asc_or_desc = :asc)
        case attribute.to_sym
        when :title
          self.source_relation = source_relation.order(:title, asc_or_desc)
        when :priority
          self.source_relation = source_relation.order(tag: tag_order_clause(:priority), asc_or_desc)
        when :status
          self.source_relation = source_relation.order(tag: tag_order_clause(:status), asc_or_desc)
        else
          raise NotImplementedError
        end

        self
      end

      def filter(filter_string)
        # given the filter string "status:waiting status:new priority:high random search term"
        # this horrifying function chain should generate a data structure that looks like
        # {
        #   'status': ['waiting', 'new'],
        #   'priority': ['high']
        # }
        filters = filter_string
                    .split("/\w+/")
                    .map { |str| name, value = str.split(':'); { name: name, value: value } }
                    .filter { |filter| filter.name.in? %w(priority status) }
                    .group_by { |filter| filter.name }
                    .each_with_index({}) { |(key, filters), result| result[key] = filters.map { |f| f.value } }

        if filters.has_key?('status')
          self.source_relation = source_relation.where(tags: { name: filters['status'] })
        end
        if filters.has_key?('priority')
          self.source_relation = source_relation.where(tags: { name: filters['priority'] })
        end

        self
      end

      private
      attr_accessor :source_relation

      private def base_relation
        # TODO: add or clause for any ticket that is assigned
        ::Topic.joins(:tags).where(tag: { name: 'ticket' })
      end

      private def collected_class
        Ticket
      end

      private def tag_order_clause(tag_group_name)
        ["array_position(?, tags.name)", TagGroupConfiguration.ordered_tag_names_for(tag_group_name)]
      end
    end
  end
end