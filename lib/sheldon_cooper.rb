class SheldonCooper
  @@words = Array.new
  @@wordcombo = Hash.new
  def initialize
    if @@words.empty?
      File.open("/usr/share/dict/words", "r") do |infile|
        while (line = infile.gets)
          @@words.push(line.strip) if line.strip != ""
        end
      end
    end
  end
  def self.correctorizor(word)
    results = Hash.new
    @@wordcombo[word] = self.combinations(word) if @@wordcombo[word].nil?
    @@words.each do |dw|
      if (results.size < 5) and results[dw] = self.score2(word, dw)
      elsif (self.score2(word, dw) > results.values.min) and results.delete(results.keys[results.values.index(results.values.min)]) and results[dw] = self.score2(word, dw)
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

  def self.score2(worda, wordb) # super slow!!
    score = 0
    @@wordcombo[worda].each do |pw|
      score += pw.size if wordb.match pw
    end
    score
  end
  def self.score(worda, wordb)
    score = 0
    worda.each_char do |l|
      score += 1 if wordb.include? l
    end
    score
  end
  def self.combinations(word)
    results = Array.new
    word.size.times do |i|    # 0, 1, 2, 3
      (i + 1).times do |j|    # 0, 01, 012, 0123
        results.push(word.slice(j, word.size - i))
      end
    end
    results
  end
end
