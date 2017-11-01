def dictionary
  {
    "hello" => "hi",
    "to" => "2",
    "two" => "2",
    "too" => "2",
    "for" => "4",
    "be" => "b",
    "you" => "u",
    "at" => "@",
    "and" => "&"
  }
end

def word_substituter(tweet)
  tweet = tweet.split(/\b/)
  tweet.each_with_index do |word, i|
    dictionary.each do |v_long, v_short|
      if word == v_long || word == v_long.capitalize
        tweet[i] = v_short
      end
    end
  end
  tweet = tweet.join
  tweet
end

def bulk_tweet_shortener(tweet_array)
  tweet_array.map do |tweet|
    puts word_substituter(tweet)
  end
end

def selective_tweet_shortener(tweet_array)
  tweet_array.each do |tweet|
    if tweet.length > 140
      puts word_substituter(tweet)
    else
      puts tweet
    end
  end
end
