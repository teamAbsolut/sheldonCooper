class SheldonCooper
  @@words = Array.new
  def initialize
    if @@words.empty?
      File.open("/usr/share/dict/words", "r") do |infile|
        while (line = infile.gets)
          @@words.push(line.strip)
        end
      end
    end
  end
  def self.correctorizor(word)
    results = Hash.new
    @@words.each do |dw|
      if results.size < 5
        results[dw] = self.score(word, dw)
      elsif self.score(word, dw) > results.values.min
        results.delete(results.keys[results.values.index(results.values.min)])
        results[dw] = self.score(word, dw)
      end
    end
    results.keys
  end
  def self.cor_wrap(word)
    result = "The results of #{word} are:"
    self.correctorizor(word).each do |cw|
      result += " #{cw}"
    end
    result
  end

  private

  def self.score(worda, wordb)
    score = 0
    worda.each_char do |l|
      score += 1 if wordb.include? l
    end
    score
  end
end
