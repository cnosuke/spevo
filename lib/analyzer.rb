module Spevo
  class Analyzer
    attr :term, :document
    def initialize(term, document)
      @term = Term.new(term)
      @document = Document.new(document)
    end

    def sort_all
      @term.sort!
      @document.sort!
      self
    end
  end

  class Term
    def initialize(term)
      @words = { }
      term_to_wakachi(term).each do |w|
        @words[w] = ( @words[w] ? @words[w]+1 : 1 )
      end
      @words
    end

    def sort!
      @words = @words.sort_by{ |k, v| v }.reverse
    end

    def term_to_wakachi(term)
      term.split(/\s/)
    end
  end

  class Document
    def initialize(doc)
      @document = doc.map do |term|
        Term.new(term)
      end
    end
    def sort!
      @document.map(&:sort!)
    end
  end
end
