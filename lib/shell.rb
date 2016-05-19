require 'open3'

module Shell
  def self.execute_cmd(cmd)
    Open3.popen3(cmd) do |stdin, stdout, stderr, wait_thr|
      output = stdout.readlines.join("\n")
      errors = stderr.readlines.join("\n")
      stdin.close
      stdout.close
      stderr.close
      # Wait for completion.
      wait_thr.value
      return [output, errors]
    end
  end

  def self.execute_cmd_raise_error(cmd)
    Rails.logger.info("executing CMD: #{cmd}")
    output, errors = execute_cmd(cmd)
    if !errors.empty?
      Rails.logger.error("Output from #{cmd} import: #{errors}, output #{output}")
      raise RuntimeError, "Error occurred running #{cmd}: #{errors}, output #{output}" unless errors.empty?
    end
    return [output, errors]
  end
end