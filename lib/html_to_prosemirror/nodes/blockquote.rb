module HtmlToProsemirror
  module Nodes
    class Blockquote < Node

      def matching
        @node.name === 'blockquote'
      end

      def data
        {
          type: "blockquote"
        }
      end
    end
  end
end
