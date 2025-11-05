# frozen_string_literal: true

module Yaks
  module Interactor
    module Caller
      def call(...)
        Yaks::Interactor::Do.new.call { super(...) }
      end
    end
  end
end
