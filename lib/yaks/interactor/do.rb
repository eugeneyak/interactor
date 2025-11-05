# frozen_string_literal: true

module Yaks
  module Interactor
    class Do
      def call(&block)
        receiver = block.binding.receiver
        stack.push receiver

        receiver
          .class
          .middlewares
          .reverse
          .reduce(block) { |stack, middleware| middleware.new(receiver, stack) }
          .call
      ensure
        stack.pop
      end

      private

      def stack
        Yaks::Interactor::Stack.instance ||= Yaks::Interactor::Stack.new
      end
    end
  end
end
