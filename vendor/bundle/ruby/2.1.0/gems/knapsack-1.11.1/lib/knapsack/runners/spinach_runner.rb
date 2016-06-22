module Knapsack
  module Runners
    class SpinachRunner
      def self.run(args)
        allocator = Knapsack::AllocatorBuilder.new(Knapsack::Adapters::SpinachAdapter).allocator

        Knapsack.logger.info
        Knapsack.logger.info 'Report features:'
        Knapsack.logger.info allocator.report_node_tests
        Knapsack.logger.info
        Knapsack.logger.info 'Leftover features:'
        Knapsack.logger.info allocator.leftover_node_tests
        Knapsack.logger.info

        cmd = %Q[bundle exec spinach #{args} -- #{allocator.stringify_node_tests}]

        system(cmd)
        exit($?.exitstatus) unless $?.exitstatus.zero?
      end
    end
  end
end
