require_relative 'exercises.rb'
require_relative 'features.rb'

class Gym
  attr_accessor :result

  BASIC = 1
  ADDITIONAL = 4

  def schedule
    @schedule ||= {
      'Tuesday' => [:delta, :biceps, :triceps, :chest],
      'Friday' => [:quadriceps, :leg_biceps, :butt, :shin, :latissimus, :trapezium, :bottom_back]
    }
  end

  def exercises
    @exercises ||= Exercises.exercises
  end

  def flat_exercises
    @flat_exercises ||= Hash[*Gym.new.exercises.values.map{|x| x.values }.flatten.map(&:to_a).flatten]
  end

  def features
    @features ||= Features.features
  end

  def behold2
    result = []

    muscles = schedule[Date::DAYNAMES[Date.today.wday]]
    muscles_comb = muscles.combination(ADDITIONAL).to_a.sample
    exercises_pool = exercises.select{|k,v| muscles.include?(k) }

    basics = exercises_pool.map {|k,v| v[:basic]}.flatten.compact.map {|x| x.keys }.flatten
    basics.sample(BASIC).each do |e|
      result << "BASIC: #{e} --- #{flat_exercises[e]}"
    end

    muscles_comb.each do |muscle|
      additionals = exercises_pool[muscle][:additional]
      selected = additionals.keys.sample
      result << "ADDITIONAL: #{selected} --- #{additionals[selected]}"
    end

    puts result.join("\n")
  end

  def behold
    result = []

    repetitions = rand_from_set(c_features[:repetitions])
    result << "repetitions: #{repetitions} times"

    approaches = rand_from_set(c_features["approaches_#{repetitions}".to_sym])
    result << "approaches: #{approaches}"

    key_part = repetitions == 5 ? 5 : 'other'
    structure = rand_from_set(c_features["structure_#{key_part}".to_sym])
    result << "structure: #{structure}"

    features_amount = rand_from_set(c_features[:features_amount])
    features_amount.times {
      feature = rand_from_set(c_features[:feature])
      result << "feature: #{feature}"
    }

    set = rand_from_set(c_features[:set])
    result << "set: #{set}"

    pose = rand_from_set(c_features[:pose])
    result << "pose: #{pose}"

    exhaustion = rand_from_set(c_features[:exhaustion])
    result << "exhaustion: #{exhaustion}"

    puts result.join("\n")

    behold2
  end

  def c_features
    return @c_features if @c_features

    @c_features = {}

    features.each do |k,v|
      @c_features[k] = to_comfy_percents(v)
    end

    @c_features
  end

  def rand_from_set(hash)
    r = rand * hash.values.last
    hash.find {|k,v| v >= r }[0]
  end

  def to_comfy_percents(hash)
    new_hash = {}
    total = hash.values.reduce(&:+)
    stor = 0

    hash.each do |k,v|
      stor += v.to_f / total
      new_hash[k] = stor.round(2)
    end

    new_hash
  end
end


