namespace :database do
  desc 'List all tables in surge DB and last usage, help find tables to remove'
  task list_recent: :environment do
    table_data = {}
    skip_large_slow_tables = %w[some_table versions]

    sql = "select * from information_schema.tables where table_schema='public' and table_type='BASE TABLE';"
    tables_array = ActiveRecord::Base.connection.execute(sql)
    tables_array.each do |table|
      table_name = table['table_name']
      next if skip_large_slow_tables.include?(table_name)

      puts "running: #{table_name}"
      begin
        sql = "select max(created_at) from #{table_name};"
        max_result = ActiveRecord::Base.connection.execute(sql).first['max']
      rescue StandardError
        max_result = 'N/A'
      end
      table_data[table_name] = max_result
    end
    table_data.sort_by { |_k, v| v.to_s }.each do |pair|
      table = pair.first
      max = pair.last
      puts "#{table}:#{max}"
    end
  end
end
