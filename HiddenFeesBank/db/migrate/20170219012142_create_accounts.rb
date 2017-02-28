class CreateAccounts < ActiveRecord::Migration[5.0]
  puts 'Migration trys to set initial account ID to adapter:' + ActiveRecord::Base.connection.adapter_name
  # the following will start the account id at 100000001 and use the syntax for
  # what database is being used
  case ActiveRecord::Base.connection.adapter_name
    when 'MySQL'
      execute('ALTER TABLE accounts AUTO_INCREMENT = 100000000')
    when 'SQLServer'
      execute('DBCC CHECKIDENT (accounts, reseed, 1000000000)')
    when 'SQLite'
      begin
	execute('insert into sqlite_sequence(name,seq) values(\'accounts\', 100000000);')
      rescue
	puts 'insert error... updating'
      end
      execute('update sqlite_sequence set seq = 100000000 where name = \'accounts\';')
    else
      puts "cant recognize the database"
  end
  def change
    create_table :accounts do |t|
      t.decimal :balance
      t.integer :acctType
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
