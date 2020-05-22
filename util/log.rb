require_relative "./color"

module Log
  def self.out(msg, label: %i[], color: nil)
    label = [label] unless label.is_a?(Array)
    output = %{[#{label.unshift(self.name).map(&:to_s).join(".")}] >> #{msg}}
    output = Color.send(color, output) unless color.nil?
    puts output
  end
end