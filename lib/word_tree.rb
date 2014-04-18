module Spevo
  class WordTree
    class Node
      attr :data
      def initialize(parent, data)
        @data = data
        @right, @left = nil, nil
        parent.append(self)
      end

      def append(node)
        if node.data > @data
          if @right
            @right.append(node)
          else
            @right = node
          end
        else
          if @left
            @left.append(node)
          else
            @left = node
          end
        end
      end
      def max
        return @data unless @right
        @right.max
      end
      def min
        return @data unless @left
        @left.min
      end
      def search(arg)
        return true if @data == arg
        return false if @left.nil? && @right.nil?
        if arg > @data
          if @right
            @right.search(arg)
          else
            false
          end
        elsif arg < @data
          if @left
            @left.search(arg)
          else
            false
          end
        else
          true
        end
      end
    end

    class Root < Node
      attr :data
      def initialize(data)
        @data = data
      end
    end

    attr :root
    def initialize(ary)
      ary = ary.dup
      @root = Tree::Root.new(ary.pop)
      ary.each do |a|
        Tree::Node.new(@root, a)
      end
    end
    def max
      @root.max
    end
    def min
      @root.min
    end
    def search(arg)
      @root.search(arg)
    end
  end
end
