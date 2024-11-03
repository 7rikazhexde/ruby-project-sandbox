# frozen_string_literal: true

require 'json'

module JsonVarsSetter
  # JSON configuration file parser
  class JsonParser
    def self.parse_config(file_path, silent: false)
      JSON.parse(File.read(file_path))
    rescue StandardError => e
      puts "Error reading or parsing JSON: #{e.message}" unless silent
      nil
    end
  end
end

# スクリプトが直接実行された場合の処理
if __FILE__ == $PROGRAM_NAME
  # プロジェクトルートディレクトリのパスを取得
  project_root = File.expand_path('../', __dir__)
  config_path = File.join(project_root, '.github/workflows/ruby_project_matrix.json')
  result = JsonVarsSetter::JsonParser.parse_config(config_path)
  puts JSON.pretty_generate(result) if result
end
