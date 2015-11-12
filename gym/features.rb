class Features
  def self.features
    {
      repetitions: {
        5 => 0.2,
        10 => 0.5,
        15 => 0.3
      },

      approaches_5: {
        2 => 0.3,
        3 => 0.6
      },

      approaches_10: {
        1 => 0.3,
        2 => 0.5,
        3 => 0.3
      },

      approaches_15: {
        1 => 0.4,
        2 => 0.4,
        3 => 0.4
      },

      structure_5: {
        rest_pause: 0.25,
        norm: 0.75
      },

      structure_other: {
        pyramid: 0.15,
        norm: 0.85
      },

      features_amount: {
        1 => 0.5,
        2 => 0.5
      },

      feature: {
        static_tension: 0.1,
        cheating: 0.1,
        peak_contraction: 0.1,
        partial_amplitude: 0.1,
        partial_repetition: 0.1,
        force_repetition: 0.1,
        drop_set: 0.1,
        burst: 0.1,
        norm: 0.2
      },

      set: {
        super_set: 0.1,
        comb_set: 0.15,
        norm: 0.75
      },

      pose: {
        standing: 0.3,
        sitting: 0.7
      },

      exhaustion: {
        prior_exhaustion: 0.1,
        norm: 0.9
      }
    }
  end
end
