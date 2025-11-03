# frozen_string_literal: true

module Yaks
  module Interactor
    class Middleware
      def self.new(receiver, app)
        instance = allocate

        instance.instance_variable_set :@receiver, receiver
        instance.instance_variable_set :@app, app

        instance.send(:initialize) if instance.respond_to?(:initialize)
        instance
      end

      def call = app.call

      protected

      attr_reader :receiver, :app

      private

      def stack = Yaks::Interactor::Stack.instance || []
    end
  end
end