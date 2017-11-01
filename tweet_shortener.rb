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

def selective_tweet_shortener(tweet)
  if tweet.length > 140
    word_substituter(tweet)
  else
    tweet
  end
end

def shortened_tweet_truncator(tweet)
  shortened_tweet = ""
  if tweet.length > 140
    shortened_tweet = word_substituter(tweet)
    if shortened_tweet > 140
      shortened_tweet[0..140] + "..."
    else
      shortened_tweet
    end
  else
    tweet
  end
end
