# frozen_string_literal: true

require_relative "interactor/version"
require_relative "interactor/caller"
require_relative "interactor/do"
require_relative "interactor/middleware"
require_relative "interactor/stack"

module Yaks
  module Interactor
    def self.extended(base)
      base.prepend Yaks::Interactor::Caller

      base.define_singleton_method :inherited do |inherited|
        inherited.prepend Yaks::Interactor::Caller
      end
    end

    def use(middleware)
      middlewares << middleware
    end

    def middlewares
      @middlewares ||=
        superclass.respond_to?(:middlewares) ? superclass.middlewares.dup : []
    end
  end
end